import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kritter/constants.dart';
import 'package:kritter/widgets/custom_button.dart';
import 'package:kritter/widgets/custom_textfield.dart';
import 'package:kritter/widgets/gap.dart';
import '../widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController idCtlr = TextEditingController();
  final TextEditingController nameCtlr = TextEditingController();
  final TextEditingController emailCtlr = TextEditingController();
  final TextEditingController dobCtlr = TextEditingController();
  final TextEditingController ygCtlr = TextEditingController();
  final TextEditingController majorCtlr = TextEditingController();
  final TextEditingController residenceCtlr = TextEditingController();
  final TextEditingController foodCtlr = TextEditingController();
  final TextEditingController movieCtlr = TextEditingController();

  // function to add user
  Future createUser(data) async {
    var url = Uri.http('127.0.0.1:5000', '/createUser');
    var response = await http.post(
      url,
      body: jsonEncode(data),
    );

    
    // print(response.body);
  }

  Future datePicker() async {
    var result = await showCalendarDatePicker2Dialog(
      context: context,
      dialogBackgroundColor: white,
      config: CalendarDatePicker2WithActionButtonsConfig(
          calendarType: CalendarDatePicker2Type.single),
      dialogSize: const Size(400, 400),
    );

    // split result
    String? date = result?[0].toString();

    List<String> newDate = date!.split(' ');

    // set dob controller text
    dobCtlr.text = newDate[0];
    // return 'date';
  }

  final List<String> items = [
    'On-Campus',
    'Off-Campus',
    // DropdownMenuItem(
    //   child: Text('On-Campus'),
    //   value: 'On-Campus',
    // ),
    // DropdownMenuItem(
    //   child: Text('Off-Campus'),
    //   value: 'Off-Campus',
    // ),
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    // dispose of text controllers
    super.dispose();
    idCtlr.dispose();
    nameCtlr.dispose();
    emailCtlr.dispose();
    ygCtlr.dispose();
    majorCtlr.dispose();
    residenceCtlr.dispose();
    foodCtlr.dispose();
    movieCtlr.dispose();
  }

  // state to manage next form
  bool nextForm = false;

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        Positioned(
          top: 0,
          right: -200,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 1.5,
            alignment: Alignment.centerRight,
            decoration: const BoxDecoration(
              // border: Border.all(),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/sc_circle.png'),
              ),
            ),
          ),
        ),
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                darkBg,
                darkBg.withOpacity(0.78),
              ],
            ),
          ),
        )),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding * 2,
            horizontal: kDefaultPadding * 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // left side containing the login form
              Text(
                'SIGN UP',
                style: TextStyle(color: grey1, fontWeight: light),
              ),
              const Gap(),
              CustomText(
                text: 'Create a new account',
                isTitle: true,
                style: TextStyle(color: white, height: 1.4, fontWeight: medium),
              ),
              const Gap(),
              Row(
                children: [
                  CustomText(
                    text: 'Already have an account?',
                    style: TextStyle(color: grey2, fontWeight: light),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () => context.go('/login'),
                    child: CustomText(
                      text: 'Sign in',
                      style: TextStyle(color: aGreen, fontWeight: medium),
                    ),
                  ),
                ],
              ),
              Gap(
                gap: kDefaultPadding,
              ),
              SizedBox(
                width: 450,
                child: Form(
                  child: nextForm
                      ? Column(
                          children: [
                            CustomTextField(
                              controller: ygCtlr,
                              placeholder: 'Year group',
                              icon: Icon(
                                Icons.power_input,
                                color: grey1,
                              ),
                            ),
                            const Gap(),
                            CustomTextField(
                              controller: majorCtlr,
                              placeholder: 'Major',
                              icon: Icon(
                                Icons.power_input,
                                color: grey1,
                              ),
                            ),
                            const Gap(),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                hint: Text(
                                  'Select Item',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                                isExpanded: true,
                                buttonStyleData: ButtonStyleData(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(color: white),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  // overlayColor: MaterialStatePropertyAll(white),
                                  height: 40,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(color: white)),
                              ),
                            ),
                            // CustomTextField(
                            //   controller: residenceCtlr,
                            //   placeholder: 'Residence',
                            //   icon: Icon(
                            //     Icons.email,
                            //     color: grey1,
                            //   ),
                            // ),
                            const Gap(),
                            CustomTextField(
                              controller: foodCtlr,
                              placeholder: 'Best Food',
                              icon: Icon(
                                Icons.calendar_month,
                                color: grey1,
                              ),
                            ),
                            const Gap(),
                            CustomTextField(
                              controller: movieCtlr,
                              placeholder: 'Best Movie',
                              icon: Icon(
                                Icons.calendar_month,
                                color: grey1,
                              ),
                            ),
                            const Gap(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 215,
                                  child: CustomButton(
                                    color: Colors.black45,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          size: 15,
                                        ),
                                        Gap(
                                          wgap: 5,
                                        ),
                                        CustomText(text: 'Previous'),
                                      ],
                                    ),
                                    onPressed: () {
                                      setState(
                                        () {
                                          nextForm = false;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 215,
                                  child: CustomButton(
                                    onPressed: () => createUser({
                                      "ID": idCtlr.text,
                                      "name": nameCtlr.text,
                                      "email": emailCtlr.text,
                                      "dob": dobCtlr.text,
                                      "year_group": ygCtlr.text,
                                      "major": "CS",
                                      "On_campus": "False",
                                      "fav_food": foodCtlr.text,
                                      "fav_movie": movieCtlr.text
                                    }),
                                    child: CustomText(
                                      text: 'Create account',
                                      style: TextStyle(fontWeight: medium),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap()
                          ],
                        )
                      : Column(
                          children: [
                            CustomTextField(
                              controller: idCtlr,
                              placeholder: 'Student ID',
                              icon: Icon(
                                Icons.power_input,
                                color: grey1,
                              ),
                            ),
                            const Gap(),
                            CustomTextField(
                              controller: nameCtlr,
                              placeholder: 'Full name',
                              icon: Icon(
                                Icons.power_input,
                                color: grey1,
                              ),
                            ),
                            const Gap(),
                            CustomTextField(
                              controller: emailCtlr,
                              placeholder: 'Email',
                              icon: Icon(
                                Icons.email,
                                color: grey1,
                              ),
                            ),
                            const Gap(),
                            CustomTextField(
                              onTap: () => datePicker().catchError(
                                (error) {
                                  return 'An error occured $error';
                                },
                              ),
                              readonly: true,
                              controller: dobCtlr,
                              placeholder: 'Date of birth',
                              icon: Icon(
                                Icons.calendar_month,
                                color: grey1,
                              ),
                            ),
                            const Gap(
                              gap: 10,
                            ),
                            const Gap(),
                            SizedBox(
                              width: double.infinity,
                              child: CustomButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CustomText(text: 'Next'),
                                    Gap(
                                      wgap: 5,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      nextForm = true;
                                    },
                                  );
                                },
                              ),
                            ),
                            const Gap(),
                          ],
                        ),
                ),
              ),
              SizedBox(
                width: 450,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: grey1.withAlpha(70),
                        )),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                            const Gap(),
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