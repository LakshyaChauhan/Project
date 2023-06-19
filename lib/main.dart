import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/Splash_Screen.dart';

void main() {
  runApp( GetMaterialApp(
    title: 'Project',
    theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
    debugShowCheckedModeBanner: false,
    home: const Splashpage(),
  ));
}
