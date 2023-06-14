import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fetch_Image_size.dart';

class Upload_Image extends StatelessWidget {
  final File? image;
  const Upload_Image({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: double.infinity -20),
            child: Image.file(
              File(image!.path).absolute,
              width: 225,
              height: 260,
            ),
          ),
          const Text(
            'Selected Image',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            width: 170,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  String imagePath = image!.path;
                  fetchImageSize(imagePath)
                      .then((size) => print('The size of the image is: $size'))
                      .catchError((error) => print('Error: $error'));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: CupertinoColors.activeBlue),
                child: const Text(
                  'Upload Image',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                )),
          )
        ],
      ),
    );
  }
}
