import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/views/homepage.dart';
import 'package:kritter/views/login_page.dart';
import 'package:kritter/widgets/nav_Item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final List screens = [
      HomePage(),
      LoginPage(),
    ];
    
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: screenSize,
        child: Container(
          width: screenSize.width,
          height: 70,
          color: Colors.red,
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
      body: screens[0],
    );
  }
}
