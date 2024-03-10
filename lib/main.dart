import 'package:flutter/material.dart';
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
  runApp(const MyApp());
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
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
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
