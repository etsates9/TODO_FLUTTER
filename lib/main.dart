import 'package:flutter/material.dart';
import 'package:todo_flutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF00438A),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF00438A),
          secondary: const Color(#ffd700)),
          tertiary: const Color(0xFF8DC2E8),
        ),
      ),
    );
  }
}