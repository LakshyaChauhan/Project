

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class Upload_Image extends StatelessWidget {
final File? image;
  const Upload_Image({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 225,
                height: 300,
                child: Stack(
                  children: [
                    Positioned(
                        child: Image.file(
                File(image!.path).absolute,
                          width: 225,
                          height: 260,
          )

                    ),
                  Positioned(
                      bottom: 10,
                      left: 38,
                      child:Text('Selected Image',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800, color: Colors.white),) )],
                ),
              ),
              SizedBox(height: 70,),
              SizedBox(
                width: 170,
                height: 60,
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CupertinoColors.activeBlue
                    ),
                    child: Text('Upload Image', style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900),)),

              )
            ],
          ),
        ),
      
    );
  }
}
