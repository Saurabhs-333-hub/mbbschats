import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mbbschats/component/dimension.dart';
import 'package:mbbschats/pages/chatpages/chatting_page.dart';

class ChatContact extends StatefulWidget {
  const ChatContact({super.key});

  @override
  State<ChatContact> createState() => _ChatContactState();
}

class _ChatContactState extends State<ChatContact> {


  final List<Map<String, String>> people = [
    {
      'image': 'assets/img_2.png',
      'name': 'Ronnie Coleman',
      'subtitle': 'Wanted to know more...',
      'time': '1hr ago'
    },
    {
      'image': 'assets/img_3.png',
      'name': 'Arnold Schwarzenegger',
      'subtitle': 'Coming to the gym...',
      'time': '2hrs ago'
    },
    {
      'image': 'assets/img_2.png',
      'name': 'Dorian Yates',
      'subtitle': 'Let\'s meet up...',
      'time': '3hrs ago'
    },
    {
      'image': 'assets/img_3.png',
      'name': 'Jay Cutler',
      'subtitle': 'Training session...',
      'time': '4hrs ago'
    },
    {
      'image': 'assets/img_2.png',
      'name': 'Phil Heath',
      'subtitle': 'Competition prep...',
      'time': '5hrs ago'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Ensures the back button is visible by default
        title: Center(child: Text('Mbbsway Chats')),
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(

          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        flexibleSpace: Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x88115C8E), Color(0x88F4829D)
              ], // Adjust colors as needed
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(SC.fromHeight(20)), // Adjust height as needed
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            decoration: BoxDecoration(
              // color: Colors.white,
              color: Color.fromRGBO(228, 228, 228, 1),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white),
            ),
            child:  TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey,fontSize: SC.fromWidth(24)),
                prefixIcon: Icon(Icons.search_sharp,color: Colors.grey,),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Adjust padding as needed
              ),
            )

          )

        ),
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: people.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: (){
                   Get.to(ChattingPage());
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: Image.asset(people[index]['image']!),
                    title: Text(
                      people[index]['name']!,
                      style: TextStyle(fontSize: SC.fromWidth(24)),
                    ),
                    subtitle: Text(
                      people[index]['subtitle']!,
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Text(
                        people[index]['time']!,
                        style: TextStyle(fontSize: SC.fromWidth(35),color: Colors.grey.shade600),
                      ),
                    ),
                  ),
                ),
              ),
         // To separate each ListTile
            ],
          );
        },
      ),
    );
  }
}
