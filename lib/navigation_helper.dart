// lib/navigation_helper.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_classes_page.dart';

class NavigationHelper {
  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  static void navigateToMyClasses(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyClassesPage()),
    );
  }
}