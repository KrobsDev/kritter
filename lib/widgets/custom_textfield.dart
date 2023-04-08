import 'package:flutter/material.dart';
import 'package:kritter/constants.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final Icon? icon;

  const CustomTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: white),
        controller: controller,
        cursorColor: grey1,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: icon ??
              const SizedBox(
                width: 0,
              ),
          suffixIconConstraints: BoxConstraints(minWidth: kDefaultPadding * 3),
          contentPadding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: 25,
          ),
          fillColor: greyBg,
          hintText: placeholder,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey1),
          ),
          hintStyle:
              Theme.of(context).textTheme.bodyMedium?.copyWith(color: grey1),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: grey1),
          ),
        ),
      ),
    );
  }
}
