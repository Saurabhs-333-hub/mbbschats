import 'package:flutter/material.dart';
import 'package:mbbschats/widgets/custom_card_widget.dart';

class NotificaitonPage extends StatefulWidget {
  const NotificaitonPage({super.key});

  @override
  State<NotificaitonPage> createState() => _NotificaitonPageState();
}

class _NotificaitonPageState extends State<NotificaitonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        title: Text('Notifications',style: TextStyle(color: Colors.black),),
        actions: [
          Icon(Icons.menu),
          SizedBox(width: 25,)
        ],
      ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x88115C8E), Color(0x88F4829D)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
          Column(
            children: [

              ReusableCardWidget(
                imagePath: 'assets/img.png',
                title: 'Lorem ipsum dolor sit amet',
                content: ' consectetur. Nisi amet eget odio gravida. Cras suspendisse nunc enim fermentum. Risus dictum consequat rhoncus diam purus egestas.',
                timestamp: '1 Day ago',
              ),

              ReusableCardWidget(
                imagePath: 'assets/img_3.png',
                title: 'Lorem ipsum dolor sit amet',
                content: ' consectetur. Nisi amet eget odio gravida.',
                timestamp: '1 Day ago',
              ),

            ],
          )
        )


    );
  }
}
