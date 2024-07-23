import 'package:flutter/material.dart';
import 'package:mbbschats/component/dimension.dart';

class ReusableCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String content;
  final String timestamp;

  const ReusableCardWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.content,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 18, top: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300.withOpacity(0.7),
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.topLeft,
          //   colors: [
          //     Color(0x15F4829D),
          //     Color(0x15115C8E),
          //   ],
          // ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 0, left: 10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
              ),
              width: 75,
              height: 75,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize:SC.fromWidth(24),// Adjust as per your design
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                
                  Container(
                    width: 300, // Adjust width as per your design
                    child: Text(
                      content,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize:SC.fromWidth(28), // Adjust as per your design
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    timestamp,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
