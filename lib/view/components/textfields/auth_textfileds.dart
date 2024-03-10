import 'package:flutter/material.dart';
import 'package:skill_sync/constants/borders.dart';
import 'package:skill_sync/constants/colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.isObscure = false,
    this.maxLength = 50,
    this.validator,
    this.onEyeTap,
  });
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final TextInputType? keyboardType;
  final int maxLength;
  final String? Function(String?)? validator;
  final VoidCallback? onEyeTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Field can't be left empty";
            }
            return null;
          },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObscure,
      style: const TextStyle(color: Colors.white),
      maxLength: maxLength,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: (isObscure)
            ? IconButton(
                onPressed: onEyeTap,
                icon: const Icon(Icons.remove_red_eye),
              )
            : null,
        counterText: maxLength == 50 ? "" : null,
        hintStyle: const TextStyle(color: Colors.white),
        counterStyle: const TextStyle(color: Colors.white),
        enabledBorder: CustomBorders().enabled,
        focusedBorder: CustomBorders().focused,
        errorBorder: CustomBorders().error,
        focusedErrorBorder: CustomBorders().focusedError,
      ),
    );
  }
}
