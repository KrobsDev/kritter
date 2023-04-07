import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/widgets/nav_Item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatelessWidget {
  final String currentPage;
  const Navbar({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    // get screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: Container(
          width: screenSize.width,
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 5,
            vertical: kDefaultPadding,
          ),
          // decoration: BoxDecoration(),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SvgPicture.asset('../../assets/images/logo.svg'),
              ),
              SizedBox(
                width: kDefaultPadding * 4,
              ),
              NavItem(
                text: 'Home',
                onTap: () => GoRouter.of(context).go('/'),
              ),
              SizedBox(
                width: kDefaultPadding * 2,
              ),
              NavItem(
                text: 'Login',
                onTap: () => GoRouter.of(context).go('/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
