import 'package:flutter/material.dart';
import 'package:kritter/constants.dart';

class CustomText extends StatelessWidget {
  final bool? isTitle;
  final bool? isSmall;
  final TextStyle? style;
  final String text;
  
  const CustomText({
    super.key,
    this.isTitle = false,
    required this.text,
    this.isSmall = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isTitle! ? text.toUpperCase() : text,
      style: isTitle!
          ? Theme.of(context).textTheme.titleLarge?.merge(style)
          : isSmall!
              ? Theme.of(context).textTheme.bodySmall?.merge(style)
              : Theme.of(context).textTheme.bodyLarge?.merge(style),
    );
  }
}
