import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/hompeage.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key, required this.sizeImage, required this.image})
      : super(key: key);
  final File image;
  final String sizeImage;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(children: [
              const SizedBox(height: 55),
              SizedBox(
                height: screenHeight / 1.7,
                width: screenwidth - 70,
                child: Image.file(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'The size of the image is $sizeImage',
                style: GoogleFonts.breeSerif(fontSize: 18),
              ),
              SizedBox(
                height: screenHeight / 8,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => false,
                      );
                    },
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 32,
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        backgroundColor: const Color.fromARGB(255, 0, 96, 160)),
                    label: Text(
                      'Home Page',
                      style: GoogleFonts.breeSerif(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
