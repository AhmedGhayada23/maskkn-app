import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/appConfig.dart';
import 'chat-screen/chat-main.dart';
import 'main-page/main-page.dart';

class BottomNavBar2 extends StatefulWidget {
  const BottomNavBar2({Key? key}) : super(key: key);

  @override
  State<BottomNavBar2> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar2> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          switch (index) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ChatScreen()));
              break;
            case 2:
            /*  Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) => FavoriteListPage()));
              break;*/
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
              break;
          }
        });
      },
      elevation: 0,
      backgroundColor: Res.lGrayColor,
      selectedItemColor: Res.kPrimaryColor,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
      ],
    );
  }
}
