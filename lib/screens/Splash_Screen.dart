import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project1/screens/hompeage.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({Key? key}) : super(key: key);

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width ;
    return Container(
        width: screenWidth ,
        alignment: Alignment.center,

        child: Padding(
          padding: const EdgeInsets.all(20),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset('assets/dic_logo.png', width: screenWidth-100,)),
          
        ),
      );


  }
}