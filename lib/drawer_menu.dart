// drawer_menu.dart
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: Text("Menu")),
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
              // Navigate to history
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Theme'),
            onTap: () {
              // Implement theme change logic
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
