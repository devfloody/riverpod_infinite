import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite/src/post_model.dart';
import 'package:riverpod_infinite/src/providers.dart';
import 'package:riverpod_infinite/src/router.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer(builder: (context, ref, child) {
        return RiverPagedBuilder<int, Post>(
          provider: postNotifierProvider,
          firstPageKey: 1,
          itemBuilder: (context, item, index) {
            log(item.toString());
            return ListTile(
              title: Text(item.author),
              subtitle: Text(item.title),
              leading: Text(item.rating.toString()),
              onTap: () => ref.read(goRouterProvider).push('/detail', extra: item),
            );
          },
          pagedBuilder: (controller, builder) {
            return PagedListView(
              pagingController: controller,
              builderDelegate: builder,
            );
          },
        );
      }),
    );
  }
}
