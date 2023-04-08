import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/widgets/custom_button.dart';
import 'package:kritter/widgets/custom_textfield.dart';
import 'package:kritter/widgets/gap.dart';

import '../widgets/custom_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailctlr = TextEditingController();
    final TextEditingController passwordctlr = TextEditingController();

    return SingleChildScrollView(
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // left side containing the login form
              Text(
                'SIGN IN',
                style: TextStyle(color: grey1, fontWeight: light),
              ),
              const Gap(),
              CustomText(
                text: 'Login to Kritter and join the\nconversation!',
                isTitle: true,
                style: TextStyle(color: white, height: 1.4, fontWeight: medium),
              ),
              const Gap(),
              Row(
                children: [
                  CustomText(
                    text: 'Don’t have an account?',
                    style: TextStyle(color: grey2, fontWeight: light),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: CustomText(
                      text: 'Sign up',
                      style: TextStyle(color: aGreen, fontWeight: medium),
                    ),
                  ),
                ],
              ),
              Gap(
                gap: kDefaultPadding * 2,
              ),
              SizedBox(
                width: 450,
                child: Form(
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailctlr,
                        placeholder: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: grey1,
                        ),
                      ),
                      const Gap(),
                      CustomTextField(
                        controller: passwordctlr,
                        placeholder: 'Password',
                        icon: Icon(
                          Icons.lock,
                          color: grey1,
                        ),
                      ),
                      const Gap(
                        gap: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot password?',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: grey1),
                        ),
                      ),
                      const Gap(
                        gap: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          onPressed: () {},
                          child: CustomText(
                            text: 'Sign in',
                            style: TextStyle(fontWeight: medium),
                          ),
                        ),
                      ),
                      const Gap(),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 1,
                            color: grey1.withAlpha(70),
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: CustomText(
                              text: 'or continue with',
                              isSmall: true,
                              style: TextStyle(color: grey1),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 1,
                            color: grey1.withAlpha(70),
                          )),
                        ],
                      ),
                      const Gap(),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          onPressed: () {},
                          color: white.withOpacity(0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  '../../assets/icons/logos_google-icon.svg'),
                              Gap(),
                              CustomText(
                                text: 'Sign in with Google',
                                style: TextStyle(fontWeight: medium),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}




// TextFormField(
//       decoration: InputDecoration(
//         filled: true,
//         contentPadding: EdgeInsets.symmetric(
//             horizontal: kDefaultPadding, vertical: 25),
//         fillColor: greyBg,
//         hintText: 'Email',
//         hintStyle: Theme.of(context)
//             .textTheme
//             .bodyMedium
//             ?.copyWith(color: grey1),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: grey1),
//         ),
//       ),
//     );