import 'package:flutter/cupertino.dart';
import 'package:maskkn/screens/main-page/main-page.dart';

class SideDrawerNavigator extends ChangeNotifier{
  Widget activeSideNavScreen= HomePage();


  navigate(Widget screen){
      activeSideNavScreen=screen;
      notifyListeners();
    }


}