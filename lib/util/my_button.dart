import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF00438A),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}