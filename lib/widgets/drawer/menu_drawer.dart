import 'package:arg_msjz/widgets/drawer/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'drawer_items.dart';

class MenuDrawer extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Obx( ()=> ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(clubName),
              accountEmail: Text(clubSlogan),
              currentAccountPicture: Image.asset(clubShieldPhotoPath),
            ),
            ...List.generate(
                _controller.menuItems.length,
                (index) => DrawerItem(
                    title: _controller.menuItems[index],
                    isActive: index == _controller.selectedIndex,
                    onPressed: () {
                      _controller.setMenuIndex(index);
                    }))
          ],
        ),)
      ),
    );
  }
}
