import 'package:flutter/material.dart';
import 'welcome_screen.dart';
void main() {
  runApp(NutriCareApp());
}

class NutriCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: WelcomeScreen(),
    );
  }
}