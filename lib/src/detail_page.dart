// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:riverpod_infinite/src/post_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.author),
      ),
      body: Column(
        children: [
          Text(post.author),
          Text(post.title),
          Text(post.body),
          Text(post.rating.toString()),
        ],
      ),
    );
  }
}
