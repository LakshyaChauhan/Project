

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'fetch_Image_size.dart';
class Upload_Image extends StatelessWidget {
final File? image;
  const Upload_Image({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth-60,
                  child: Column(
                    children: [
                      Image.file(
                        File(image!.path).absolute,

                        fit: BoxFit.cover,
                      ),
                       SizedBox(height: 25,),
                       Text('Selected Image',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold, color: Colors.white,),
                 )],
                  )
                ),
                SizedBox(height: 50,),
                SizedBox(
                  width: screenWidth-150,

                  child: ElevatedButton(
                      onPressed: (){
                        String imagePath = image!.path;
                        fetchImageSize(imagePath)
                            .then((size) => print('The size of the image is: $size'))
                            .catchError((error) => print('Error: $error'));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: CupertinoColors.activeBlue
                      ),
                      child: Text('Upload Image', style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w900),)),

                )
              ],
            ),
          ),
    );
      

  }
}
