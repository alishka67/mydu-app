import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyDuAppRoot());
}

class MyDuAppRoot extends StatelessWidget {
  const MyDuAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const LoginScreen(),
    );
  }
}