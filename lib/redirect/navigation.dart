import 'package:flutter/material.dart';
import 'package:messageapp/pages/ChatRoomPage.dart';
import 'package:messageapp/pages/appointmenmt.dart';
import 'package:messageapp/pages/home.dart';
import 'package:messageapp/pages/search.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int myIndex = 0;
  List <Widget> widgetList = [
    Home(),
    ChatRoomPage(userModel: widget.userModel, firebaseUser: widget.firebaseUser, targetUser: null, chatroom: null,),
    Search(),
    Appointment(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation bar"),
      ),
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: Colors.indigo,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Chat",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Appointment",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Search",
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
