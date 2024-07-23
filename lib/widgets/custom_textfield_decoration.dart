import 'package:flutter/material.dart';

class CustomTextFieldDecoration extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSendMessage;

  const CustomTextFieldDecoration({
    required this.controller,
    required this.onSendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        maxLines: null,
        controller: controller,

        decoration: InputDecoration(
          suffixIcon: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 42, // Adjust size as needed
                height: 42, // Adjust size as needed
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // Shadow color with opacity
                      spreadRadius: 1, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 1), // Offset in the x and y direction
                    ),
                  ],
                  color: Colors.white, // Grey background color
                  shape: BoxShape.circle,
                ),
              ),
              InkWell(
                onTap: onSendMessage,
                child: Container(
                  width: 36, // Slightly smaller than the grey background
                  height: 36, // Slightly smaller than the grey background
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple], // Gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent, // Transparent to show the gradient
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          hintText: 'Type a message...',
          hintStyle: TextStyle(color: Colors.grey.shade400),

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          fillColor: Color.fromRGBO(228, 228, 228, 1), // Background color inside the TextField
          filled: true, // Enable the fillColor property
        ),
        style: TextStyle(
          color: Colors.black, // Text color
        ),
        cursorColor: Colors.blue, // Cursor color
      ),
    );
  }
}
