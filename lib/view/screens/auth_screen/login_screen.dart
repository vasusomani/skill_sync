import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_sync/constants/colors.dart';
import 'package:skill_sync/view/components/textfields/auth_textfileds.dart';
import 'package:skill_sync/view/routes/route_animations.dart';
import 'package:skill_sync/view/screens/auth_screen/signup_screen.dart';

import '../../components/custom_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SvgPicture.asset("assets/images/skillsync_text.svg",
                    width: MediaQuery.sizeOf(context).width * 0.8),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New User?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    // onPressed: () => Navigator.pushNamed(context, '/signup'),
                    onPressed: () => Navigator.push(
                      context,
                      CustomRoute(
                          page: const SignupScreen(), animationType: "slide"),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(left: 5),
                    ),
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: CustomColors.primaryColor,
                            decorationColor: CustomColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AuthTextField(
                          controller: emailController,
                          hintText: "Enter email address"),
                      const SizedBox(height: 25),
                      AuthTextField(
                        controller: passwordController,
                        hintText: "Enter password",
                        isObscure: true,
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/forgot_password'),
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: CustomColors.primaryColor,
                                  decorationColor: CustomColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        onPressed: () => Navigator.pushNamed(context, '/home'),
                        title: "Login",
                      ),
                    ],
                  ),
                ),
              ),
              //or with 2 lines
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: const Divider(
                        color: CustomColors.secondaryColor1,
                        height: 36,
                        indent: 15,
                      ),
                    ),
                  ),
                  Text(
                    "or",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: CustomColors.secondaryColor1,
                        ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: const Divider(
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
      )),
    );
  }
}
