import 'package:flutter/material.dart';
import 'package:kritter/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Login',
          style: TextStyle(color: white),
        ),
      ),
    );
  }
}
