import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite/src/post_model.dart';
import 'package:riverpod_infinite/src/post_notifier.dart';
import 'package:riverpod_infinite/src/post_repository.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: "https://quote-api.dicoding.dev/",
    ),
  );
});

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final Dio dio = ref.watch(dioProvider);
  return PostRepositoryImpl(dio: dio);
});

final postNotifierProvider = StateNotifierProvider<PostNotifierWithPagination, PagedState<int, Post>>((ref) {
  return PostNotifierWithPagination(ref);
});