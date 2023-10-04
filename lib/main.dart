import 'package:flutter/material.dart';
import 'package:toooons/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // HomeScreen을 MaterialApp 내에 추가
    );
  }
}
