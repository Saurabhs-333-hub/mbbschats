
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mbbschats/component/dimension.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final List<Color> gradientColors;
  final double borderRadius;
  final double fontSize;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.gradientColors = const [Color(0xFFF115C8E), Color(0xFFFFF4829D)], // Default gradient colors
    this.borderRadius = 10.0, // Default border radius
    this.fontSize = 20.0, // Default font size
    this.textColor = Colors.white, // Default text color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SC.fromHeight(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: GFButton(
        onPressed: onPressed,
        color: Colors.transparent, // Make button background transparent
        borderShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
            SizedBox(width: 5,),
            Icon(Icons.arrow_forward,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
