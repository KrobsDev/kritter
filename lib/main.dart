import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/views/homepage.dart';
import 'package:kritter/views/login_page.dart';
import 'package:kritter/widgets/Navbar.dart';
import 'package:kritter/widgets/custom_route.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => Navbar(child: child),
      routes: [
        CustomGoRoute(
          path: '/',
          child: const HomePage(),
        ),
        CustomGoRoute(
          path: '/login',
          child: const LoginPage(),
        ),
        
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Kritter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch:,
        primaryColor: darkBg.toColor(),
        canvasColor: darkBg.toColor(),
      ),
      // home: const Navbar(),
    );
  }
}
