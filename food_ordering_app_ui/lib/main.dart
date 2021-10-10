import 'package:flutter/material.dart';
import 'package:food_ordering_app_ui/constants.dart';
import 'package:food_ordering_app_ui/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: HomePage(),
    );
  }
}