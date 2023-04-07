import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/widgets/nav_Item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kritter/widgets/router.dart';

class NavContent extends StatelessWidget {
  const NavContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: SvgPicture.asset('../../assets/images/logo.svg')),
        SizedBox(
          width: kDefaultPadding * 4,
        ),
        NavItem(
          text: 'Home',
          onTap: () => context.go('/'),
        ),
        SizedBox(
          width: kDefaultPadding * 2,
        ),
        NavItem(
          text: 'Login',
          onTap: () => context.go('/login'),
        ),
      ],
    );
  }
}
