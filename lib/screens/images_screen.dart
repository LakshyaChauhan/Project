import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/hompeage.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key, required this.image});
  final Uint8List image ;



  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    
    List<int> byteData = [116, 101, 109, 112, 95, 105, 109, 97, 103, 101, 46, 106, 112, 103];
    final imageData = Uint8List.fromList(byteData);




    return Scaffold(
      backgroundColor: Colors.black,
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
                child: Image.memory(
                  widget.image
                ),
                ),

              const SizedBox(
                height: 50,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
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
