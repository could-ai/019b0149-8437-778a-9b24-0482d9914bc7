import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_colors.dart';
import 'package:couldai_user_app/screens/welcome_screen.dart';
import 'package:couldai_user_app/screens/main_screen.dart';
import 'package:couldai_user_app/screens/lesson_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LingoLearn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.green,
          primary: AppColors.green,
          surface: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'Nunito', // Assuming standard font or system default for now
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.grey),
          titleTextStyle: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            foregroundColor: AppColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/main': (context) => const MainScreen(),
        '/lesson': (context) => const LessonScreen(),
      },
    );
  }
}
