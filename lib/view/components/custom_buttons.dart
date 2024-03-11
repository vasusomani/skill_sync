import 'package:flutter/material.dart';
import 'package:skill_sync/constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isLoading = false});
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: CustomColors.secondaryColor2,
              offset: const Offset(3, 5),
              blurRadius: 0,
            )
          ],
          color: CustomColors.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.style,
      this.isLoading = false});
  final String title;
  final TextStyle? style;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          backgroundColor: Colors.black,
          foregroundColor: CustomColors.primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: CustomColors.primaryColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: FittedBox(
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
