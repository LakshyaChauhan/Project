import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project1/hompeage.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({Key? key}) : super(key: key);

  @override
  State<Splash_page> createState() => _Splash_pageState();
}

class _Splash_pageState extends State<Splash_page> {
  @override
  void initState() {
    Timer(Duration(seconds: 4),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    super.initState();
  }
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