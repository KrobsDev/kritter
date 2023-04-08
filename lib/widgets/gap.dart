import 'package:flutter/material.dart';
import 'package:kritter/constants.dart';

class Gap extends StatelessWidget {
  final double? gap, wgap;
  const Gap({
    super.key,
    this.gap,
    this.wgap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gap ?? kDefaultPadding,
      width: wgap ?? kDefaultPadding,
    );
  }
}
