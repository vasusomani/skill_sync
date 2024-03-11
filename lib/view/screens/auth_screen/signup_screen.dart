import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_sync/view/components/custom_dropdown.dart';
import 'package:skill_sync/view/components/textfields/auth_textfileds.dart';
import 'package:skill_sync/view/components/custom_buttons.dart';

import '../../../constants/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  List<String> occupationItems = [
    'Student',
    'Employed',
    'Self-Employed',
    'Entrepreneur',
    'Homemaker',
    'Retired',
    'Job Seeker',
    'Freelancer',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create an account'),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    AuthTextField(
                      controller: nameController,
                      hintText: "Enter name",
                    ),
                    const SizedBox(height: 25),
                    AuthTextField(
                      controller: emailController,
                      hintText: "Enter email address",
                    ),
                    const SizedBox(height: 25),
                    AuthTextField(
                      controller: phoneController,
                      hintText: "Enter phone number",
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 25),
                    AuthTextField(
                      controller: ageController,
                      hintText: "Enter age",
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 25),
                    CustomDropDown(
                      items: occupationItems,
                      controller: occupationController,
                    ),
                    const SizedBox(height: 50),
                    PrimaryButton(
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                      title: "Sign Up",
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 15.0),
                            child: Divider(
                              color: CustomColors.secondaryColor1,
                              height: 36,
                              indent: 15,
                            ),
                          ),
                        ),
                        Text(
                          "or",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: CustomColors.secondaryColor1,
                              ),
                        ),
                        Expanded(
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 15.0, right: 10.0),
                            child: Divider(
                              color: CustomColors.secondaryColor1,
                              height: 36,
                              endIndent: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/google-logo.svg",
                          height: 65,
                        ),
                        const SizedBox(width: 40),
                        SvgPicture.asset(
                          "assets/icons/github-logo.svg",
                          color: Colors.white,
                          height: 60,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
