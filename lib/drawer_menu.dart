import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/reading_history.dart';

import 'controller/theme controller.dart';


class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GetX ThemeController instance
    final ThemeController themeController = Get.find<ThemeController>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Menu"),
            decoration: BoxDecoration(
              color: Colors.blue, // Set the background color here
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Navigate to home
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Reading History'),
            onTap: () {
              Get.to(() => HistoryPage());
            },
          ),
          ListTile(
            title: Text('Theme'),
            trailing: Obx(() {
              // Listening for changes in theme mode
              return Switch(
                value: themeController.isDarkMode.value,
                onChanged: (bool value) {
                  themeController.toggleTheme(); // Toggle theme on switch
                },
              );
            }),
            onTap: () {

              themeController.toggleTheme();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
