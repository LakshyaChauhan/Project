import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/hompeage.dart';
import 'package:project1/screens/images_screen.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';

import '../Functions/fetch_image_size.dart';
import '../Functions/userdata.dart';

class UploadImage extends StatefulWidget {
  // const UploadImage({Key? key}) : super(key: key);
  final File? image;
  const UploadImage({Key? key, required this.image}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {

  TextEditingController imagetitle = TextEditingController();
  bool is_loading=false;
  @override
  void dispose() {
    imagetitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:is_loading? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )
                         :SingleChildScrollView(
                            child: SizedBox(
                              width: screenWidth - 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Image.file(
                                    File(widget.image!.path).absolute,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 20,
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
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: screenWidth - 80,
                                    height: 50,
                                    child: TextField(
                                      controller: imagetitle,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          label: const Text('Enter the title for image'),
                                          labelStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic,
                                              color: CupertinoColors.systemGrey),
                                          disabledBorder: const OutlineInputBorder(
                                            borderSide:  BorderSide(
                                                color: CupertinoColors.systemGrey, width: 2.5),
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide:  BorderSide(
                                                color: CupertinoColors.systemGrey, width: 5),
                                          ),
                                          enabledBorder:const  OutlineInputBorder(
                                              borderSide:  BorderSide(
                                                  color: CupertinoColors.systemGrey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(21),
                                              borderSide: const BorderSide(
                                                  color: CupertinoColors.activeBlue, width: 2.5))),
                                    ),
                                  ),
                                  const  SizedBox(
                                    height: 60,
                                  ),
                                  SizedBox(
                                    width: screenWidth - 150,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          is_loading= true;
                                          String imagePath = widget.image!.path;
                                          fetchImage(imagePath)
                                              .then((image) => Navigator.push(context,
                                              MaterialPageRoute(builder: (context) {
                                                return ImageScreen(
                                                  image: image,

                                                );
                                              })))
                                              .catchError(
                                                (error) => print('Error: $error'),
                                          );

                                          // uploadImage(folder_Id!, imagePath, imagetitle.text);
                                          setState(() {

                                          });
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
      ),
    );
  }
}
