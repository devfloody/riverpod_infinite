// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:riverpod_infinite/src/post_model.dart';

abstract class PostRepository {
  Future<List<Post>> fetchItems({int? page, int? size});
}

class PostRepositoryImpl extends PostRepository {
  final Dio dio;

  PostRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<Post>> fetchItems({int? page, int? size}) async {
    try {
      final Response response = await dio.get(
        'list',
        queryParameters: {
          'page': page,
          'size': size,
        },
      );

      if (response.statusCode == 200) {
        final List<Post> data = response.data.map<Post>((data) => Post.fromJson(data)).toList();
        inspect(data);
        return data;
      } else {
        return [];
      }
    } on DioError catch (e) {
      inspect(e.response);
      rethrow;
    }
  }
}
