import 'package:flutter/material.dart';
import 'colors.dart';

class CustomBorders {
  InputBorder enabled = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(18),
  );
  InputBorder focused = OutlineInputBorder(
    borderSide: BorderSide(color: CustomColors.primaryColor),
    borderRadius: BorderRadius.circular(18),
  );
  InputBorder error = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(18),
  );
  InputBorder focusedError = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(18),
  );
}
