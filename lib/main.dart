import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/theme controller.dart';
import 'home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Initialize the ThemeController with GetX
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter News App',
      home: HomePage(),
      builder: (context, child) {
        return Obx(() {
          // Listen to theme changes and update the theme mode
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: _themeController.currentTheme, // Use the reactive theme mode from GetX
            home: child,
          );
        });
      },
    );
  }
}
