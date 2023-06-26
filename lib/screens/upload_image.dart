import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/images_screen.dart';

import '../Functions/fetch_image_size.dart';
import '../Functions/userdata.dart';

class UploadImage extends StatelessWidget {
  final File? image;
  const UploadImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenWidth - 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: screenHeight * 2 / 3,
                child: Image.file(
                  File(image!.path).absolute,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Selected Image',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: screenWidth - 150,
                child: ElevatedButton(
                    onPressed: () {
                      String imagePath = image!.path;

                      fetchImageSize(imagePath)
                          .then((size) => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                print('Size of Image is $size');
                                return ImageScreen(
                                  sizeImage: size,
                                  image: image!,
                                );
                              })))
                          .catchError(
                            (error) => print('Error: $error'),
                          );
                      uploadImage(createdFolderId, imagePath,'name');
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: CupertinoColors.activeBlue),
                    child: const Text(
                      'Upload Image',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
