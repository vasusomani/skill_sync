import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skill_sync/view/routes/routing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillSync',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        primaryColor: CustomColors.primaryColor,
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
              MaterialStateProperty.all(CustomColors.primaryColor),
          dayForegroundColor:
              MaterialStateProperty.all(CustomColors.secondaryColor1),
          weekdayStyle: const TextStyle(
            fontSize: 15,
            color: CustomColors.secondaryColor1,
            fontWeight: FontWeight.w600,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColors.backgroundColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 25,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: CustomColors.primaryColor),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            color: CustomColors.secondaryColor1,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
          displayLarge: TextStyle(
            color: CustomColors.secondaryColor2,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            color: CustomColors.tertiaryColor,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          labelMedium: TextStyle(
            color: CustomColors.secondaryColor2,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
