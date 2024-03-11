import 'package:flutter/material.dart';
import 'package:skill_sync/constants/borders.dart';
import 'package:skill_sync/constants/colors.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.isDateTime = false,
    this.isObscure = false,
    this.maxLength = 50,
    this.prefixIcon,
    this.maxLines = 1,
    required this.label,
    this.hintStyle,
    this.validator,
    this.onEyeTap,
  });
  final TextEditingController controller;
  final String hintText;
  final bool isDateTime;
  final String label;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final bool isObscure;
  final TextInputType? keyboardType;
  final int maxLength;
  final int maxLines;
  final String? Function(String?)? validator;
  final VoidCallback? onEyeTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDateTime) {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: CustomColors.secondaryColor2,
                    onPrimary: CustomColors.secondaryColor1,
                    surface: CustomColors.secondaryColor1,
                    onSurface: CustomColors.secondaryColor1,
                  ),
                  dialogBackgroundColor: CustomColors.backgroundColor,
                  datePickerTheme: DatePickerThemeData(
                    backgroundColor: CustomColors.backgroundColor,
                    headerHeadlineStyle: const TextStyle(
                      color: CustomColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    dayStyle: const TextStyle(
                      fontSize: 15,
                      color: CustomColors.secondaryColor1,
                      fontWeight: FontWeight.w600,
                    ),
                    todayBorder: BorderSide(
                      color: CustomColors.primaryColor,
                      width: 2,
                    ),
                    confirmButtonStyle: TextButton.styleFrom(
                      primary: CustomColors.primaryColor,
                      backgroundColor: CustomColors.backgroundColor,
                    ),
                    cancelButtonStyle: TextButton.styleFrom(
                      primary: CustomColors.secondaryColor1,
                    ),
                    headerForegroundColor: CustomColors.primaryColor,
                    dividerColor: CustomColors.primaryColor,
                    todayForegroundColor:
                        MaterialStateProperty.all(CustomColors.secondaryColor1),
                    dayForegroundColor:
                        MaterialStateProperty.all(CustomColors.secondaryColor1),
                    weekdayStyle: const TextStyle(
                      fontSize: 15,
                      color: CustomColors.secondaryColor1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                child: child!,
              );
            },
          ).then((value) {
            if (value != null) {
              controller.text = value.toString().substring(0, 10);
            }
          });
        }
      },
      child: TextFormField(
        enabled: !isDateTime,
        style: const TextStyle(color: CustomColors.primaryColor, fontSize: 15),
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
          labelText: label,
          counterStyle: const TextStyle(
            color: Colors.white,
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          hintText: hintText,
          counterText: maxLength == 50 ? "" : null,
          suffixIcon: (isObscure)
              ? IconButton(
                  onPressed: onEyeTap,
                  icon: const Icon(Icons.remove_red_eye),
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: CustomBorders().enabled,
          disabledBorder: CustomBorders().enabled,
          focusedBorder: CustomBorders().focused,
          errorBorder: CustomBorders().error,
          focusedErrorBorder: CustomBorders().focusedError,
          hintStyle: (hintStyle) ?? TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
