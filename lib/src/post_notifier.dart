// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_infinite/src/pagination_state.dart';

class PostPaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  PostPaginationNotifier({
    required this.fetchNextItems,
    required this.itemsPerBatch,
  }) : super(const PaginationState.loading());

  final Future<List<T>> Function(T? item) fetchNextItems;
  final int itemsPerBatch;

  final List<T> _items = [];

  bool noMoreItems = false;

  void init() {
    if (_items.isEmpty) {
      // fetchFirstBatch();
    }
  }

  void updateData(List<T> result) {
    noMoreItems = result.length < itemsPerBatch;

    if (result.isEmpty) {
      state = PaginationState.data(_items);
    } else {
      state = PaginationState.data(_items..addAll(result));
    }
  }
}
