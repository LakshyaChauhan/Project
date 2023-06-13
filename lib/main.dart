import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/hompeage.dart';

void main() {
  runApp( GetMaterialApp(
    title: 'Project',
    theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}
