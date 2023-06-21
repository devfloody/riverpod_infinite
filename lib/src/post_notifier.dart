import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite/src/post_model.dart';
import 'package:riverpod_infinite/src/providers.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class PostNotifierWithPagination extends PagedNotifier<int, Post> {
  final Ref ref;
  PostNotifierWithPagination(this.ref)
      : super(
          load: (page, limit) async {
            return await ref.read(postRepositoryProvider).fetchItems(page: page, size: limit);
          },
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );

  void updatePostAuthor(String author) {
    state = state.copyWith(records: [
      for (var currentPost in state.records!)
        if (currentPost.author == author) currentPost.copyWith(author: 'Ling') else currentPost,
    ]);
  }
}
