import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/views/homepage.dart';
import 'package:kritter/views/login_page.dart';
import 'package:kritter/widgets/Navbar.dart';
import 'package:kritter/widgets/navbar_stateful.dart';

void main() {
  runApp(const MyApp());
}

// Application Routes
final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: _router,
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
      // home: const NavbarStateful(),
    );
  }
}
