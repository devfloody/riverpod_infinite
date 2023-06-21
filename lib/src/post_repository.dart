// ignore_for_file: public_member_api_docs, sort_constructors_first
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
        final List<Post> data = response.data
            .map<Post>(
              (data) => Post(
                title: data['sr'],
                body: data['en'],
                author: data['author'],
                rating: double.parse((data['rating']).toString()),
              ),
            )
            .toList();
        return data;
      } else {
        return [];
      }
    } catch (_) {
      rethrow;
    }
  }
}
