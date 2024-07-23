

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:mbbschats/component/dimension.dart';
import 'package:mbbschats/pages/chatpages/chat_contact.dart';
import 'package:mbbschats/pages/notification_pages/notificaiton.dart';
import 'package:mbbschats/pages/profilepages/user_profile.dart';



class MyBottomNavigationBar extends StatefulWidget {
  int? page;
  MyBottomNavigationBar({this.page, super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> with SingleTickerProviderStateMixin {
  int currentPage = 0;
  int backPress = 0;

  final List<Widget> pages = [
    ChatContact(),
    NotificaitonPage(),
    UserProfile(),

  ];

  @override
  void initState() {
    super.initState();
    if (widget.page != null) {
      currentPage = widget.page!;
    }
  }

  void animateToPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backPress++;
        if (backPress == 2) {
          return true;
        } else {
          Timer(Duration(seconds: 1), () {
            backPress = 0;
          });
        }
        return false;
      },
      child: Scaffold(
        body: PageTransitionSwitcher(
          duration: Duration(milliseconds: 700),
          transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: pages[currentPage],
        ),

        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.only(top: 3),
          color: Colors.white,
          child: BottomAppBar(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              iconSize: SC.from_width(22),
              type: BottomNavigationBarType.fixed,
              currentIndex: currentPage,
              selectedItemColor: Color(0xFFF4829D),
              unselectedItemColor: Colors.black,
              selectedLabelStyle: TextStyle(color: Color(0xFF115C8E)),
              unselectedLabelStyle: TextStyle(color: Color(0xFF115C8E)),
              onTap: (page) {
                if (page != currentPage) {
                  animateToPage(page);
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.message,
                color: currentPage == 0 ? Color(0xFFF4829D) : Colors.grey
                  ),
                  label: "Chat",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: currentPage == 1 ? Color(0xFFF4829D) : Colors.grey,
                  ),
                  label: "Notification",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    color: currentPage == 2 ? Color(0xFFF4829D) : Colors.grey,
                  ),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}


