import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/widgets/navbar.dart';

class NavbarStateful extends StatefulWidget {
  const NavbarStateful({super.key});

  @override
  State<NavbarStateful> createState() => _NavbarStatefulState();
}

class _NavbarStatefulState extends State<NavbarStateful> {
  // current page we are on
  late String _currentPage;

  @override
  void initState() {
    // TODO: implement initState
    _currentPage = '/';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Navbar(currentPage: _currentPage),
          ),
          Expanded(child: GoRouter(routes: []))
          // GoRouter(routes: [GoRoute(path: '')])
        ],
      ),
    );
  }
}
