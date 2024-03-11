import 'package:flutter/material.dart';
import 'colors.dart';

class CustomBorders {
  final double radius;

  CustomBorders({this.radius = 18});

  BorderRadius get borderRadius => BorderRadius.all(Radius.circular(radius));

  InputBorder get enabled => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: borderRadius,
      );

  InputBorder get focused => OutlineInputBorder(
        borderSide: const BorderSide(color: CustomColors.primaryColor),
        borderRadius: borderRadius,
      );

  InputBorder get error => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: borderRadius,
      );

  InputBorder get focusedError => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: borderRadius,
      );
}
