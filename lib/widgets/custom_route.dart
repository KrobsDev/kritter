import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// custom Go route to attach a Material Page Widget to the rendered child
// this is to remove the animations GoRoute adds by default
class CustomGoRoute extends GoRoute {
  CustomGoRoute({
    required String path,
    required Widget child,
  }) : super(
          path: path,
          pageBuilder: (p0, p1) => MaterialPage(child: child),
        );
}
