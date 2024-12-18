import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/global_controller.dart';
import 'package:weather_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dự báo thời tiết',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blueGrey[50],
      ),
      home: const HomeScreen(),
    );
  }
}
