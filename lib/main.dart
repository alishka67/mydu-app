import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'db/app_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppDb.instance.database;

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