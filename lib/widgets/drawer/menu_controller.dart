import 'package:arg_msjz/club_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arg_msjz/Club/ui/screens/contact_screen.dart';
import 'package:arg_msjz/Club/ui/screens/sports_screen.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldfKey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems => ["Noticias", "Deportes", "Contacto"];
  List<Widget> get menuScreens => [ClubHome(), SportsScreen(), ContactScreen()];
  GlobalKey<ScaffoldState> get scaffoldfKey => _scaffoldfKey;

  void openOrCloseDrawer() {
    if (_scaffoldfKey.currentState.isDrawerOpen) {
      _scaffoldfKey.currentState.openEndDrawer();
    } else {
      _scaffoldfKey.currentState.openDrawer();
    }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }
}
