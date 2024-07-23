import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbbschats/component/dimension.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        
      ),
      extendBodyBehindAppBar: true,

      body:  Container(
        width: double.infinity,
        height: double.infinity,
        child:
        Column(

          children: [
            SizedBox(height: 120,),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: 80,
                height: 80,
                child: Image.asset('assets/img_4.png',fit: BoxFit.cover,),
                decoration: BoxDecoration(
                    color: Colors.blue,
                  borderRadius: BorderRadius.circular(60)
                ),

              ),
            ),
            SizedBox(height: 20,),
            Text('Shikha Tripathi',style: TextStyle(color: Colors.grey.shade700,fontSize: SC.fromWidth(18),fontWeight: FontWeight.w500),),

            Text('Shikhatripathi@gmail.com',style: TextStyle(color: Colors.grey.shade700,fontSize: SC.fromWidth(20)),),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0x88115C8E), Color(0x88F4829D)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),

      ),
      bottomSheet: BottomSheet(
        builder: (context) => Container(
          padding: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          height: SC.fromHeight(2.5),
          child:  ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: _buildListTiles(),
          ),
        ),
        onClosing: () {},
      ),
    );


  }




  // CUSTOM LIST TILE //
  List<Widget> _buildListTiles() {
    final items = [
      {'icon': Icons.settings, 'title': 'General Setting'},
      {'icon': Icons.chat_rounded, 'title': 'Chat Settings'},
      {'icon': Icons.notifications, 'title': 'Notification Settings'},
      {'icon': Icons.display_settings, 'title': 'Display Settings'},
      {'icon': Icons.storage, 'title': 'Data and Storage Settings'},
    ];

    return items.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListTile(
          leading: Icon(item['icon'] as IconData,color: Color.fromRGBO(17, 92, 142, 1),),
          title: Text(item['title'] as String,style: TextStyle(color: Color.fromRGBO(80, 80, 80, 1),fontSize: SC.fromContextWidth(context, 23,)),),
          trailing: Icon(Icons.arrow_forward_ios,color: Color.fromRGBO(17, 92, 142, 1),),
        ),
      );
    }).toList();
  }
}
