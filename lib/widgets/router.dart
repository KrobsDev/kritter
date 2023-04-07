import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRouter extends StatelessWidget {
  final Widget widget;
  final String path;

  const MyRouter({super.key, required this.widget, required this.path});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        // routerConfig: router,
        );
  }
}
