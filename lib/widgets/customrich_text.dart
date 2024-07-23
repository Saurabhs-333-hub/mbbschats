import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Create a reusable widget
class CustomRichText extends StatelessWidget {
  final String text;
  final String clickableText;
  final double fontSize;
  final VoidCallback onTap;

  CustomRichText({
    required this.text,
    required this.clickableText,
    required this.fontSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.grey, // Default text color
          fontSize: fontSize,
        ),
        children: <TextSpan>[
          TextSpan(
            text: clickableText,
            style: TextStyle(
              color: Color(0xFFF0437E9), // Different color for clickable text
              fontWeight: FontWeight.bold, // Optional: make it bold
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}