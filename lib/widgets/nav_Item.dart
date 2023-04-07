import 'package:flutter/material.dart';
import 'package:kritter/constants.dart';

class NavItem extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const NavItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(color: white),
      ),
    );
  }
}
