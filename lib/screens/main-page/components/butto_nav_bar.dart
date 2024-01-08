
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../appConfig.dart';
import '../../chat-screen/chat-main.dart';
import '../../favorite-list/favorite-list.dart';
import '../main-page.dart';

class BottomNavBar extends StatefulWidget {
   BottomNavBar({Key? key, required this.startIndex}) : super(key: key);
  int startIndex;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  late int _selectedIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) => HomePage()));
          break;
        case 1:
         Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));
          break;
        case 2:
       Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) => FavoriteList()));
          break;
        case 3:
          Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) => HomePage()));
          break;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.startIndex;
    return BottomNavigationBar(

        elevation: 0,
        backgroundColor: Res.lGrayColor,
        selectedItemColor: Res.kPrimaryColor,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "",),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: ""),
        ]

    );
  }
}
