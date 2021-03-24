import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:news/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
