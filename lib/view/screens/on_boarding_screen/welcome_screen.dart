import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_sync/constants/colors.dart';
import 'package:skill_sync/view/components/custom_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/on-boarding.png",
          width: MediaQuery.sizeOf(context).width,
        ),
        SizedBox(height: 20),
        SvgPicture.asset("assets/images/skillsync_text.svg",
            width: MediaQuery.sizeOf(context).width * 0.8),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Text("Where great minds work together",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 20, height: 1.5)),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PrimaryButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              title: "Let's Start!"),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("Let's start innovating together with Skill Sync!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: CustomColors.primaryColor.withOpacity(0.75),
                  )),
        ),
        SizedBox(height: 30),
      ],
    ));
  }
}
