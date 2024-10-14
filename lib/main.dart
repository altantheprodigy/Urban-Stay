import 'package:flutter/material.dart';
import 'package:urban_stay/feature/authentication/register/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: forest600),
        useMaterial3: true,
      ),
      home: const RegisterScreen(),
    );
  }
}