import 'package:flutter/material.dart';
import 'package:frontend/mainScreen.dart';
import 'package:frontend/pages/auth/login/login.dart';
import 'package:frontend/pages/auth/signup/signup.dart';
import 'package:frontend/pages/lesson/lesson.dart';
import 'package:frontend/pages/onboarding/onboarding.dart';
import 'package:frontend/pages/profile/profile.dart';
import 'package:frontend/pages/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
