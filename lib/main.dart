import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter News App',
      home: HomePage(),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData.light(),
         // darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          home: child,
        );
      },
    );
  }
}
