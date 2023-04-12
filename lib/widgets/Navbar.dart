import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/widgets/nav_Item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatelessWidget {
  final Widget child;
  const Navbar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: screenSize,
        child: Container(
          width: screenSize.width,
          height: 70,
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 5,
            vertical: kDefaultPadding,
          ),
          // decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SvgPicture.asset('../../assets/images/logo.svg'),
              ),
              SizedBox(
                width: kDefaultPadding * 4,
              ),
              Row(
                children: [
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
              )
            ],
          ),
        ),
      ),
      body: child,
    );
  }
}
