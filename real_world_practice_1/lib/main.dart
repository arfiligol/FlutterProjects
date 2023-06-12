import 'package:flutter/material.dart';
import 'package:real_world_practice_1/registor_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade300,
        body: const Center(
          child: UserRegisterPage(),
        ),
      ),
    );
  }
}
