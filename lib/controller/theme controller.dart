import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  // RxBool to track the theme mode
  RxBool isDarkMode = false.obs;

  // Method to toggle the theme mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  // Getter to return the current theme mode
  ThemeMode get currentTheme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
}
