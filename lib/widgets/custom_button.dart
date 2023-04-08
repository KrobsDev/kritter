import 'package:flutter/material.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? color;

  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: kDefaultPadding + 5),
        ),
        backgroundColor: MaterialStatePropertyAll(color ?? btnGreen),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
