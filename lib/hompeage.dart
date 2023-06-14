import 'package:flutter/material.dart';
import 'package:project1/browse.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:project1/capture.dart';
import 'package:project1/upload_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {
  File? selectedImage;




class _HomePageState extends State<HomePage> {
  File? selectedImage;

  void capture(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return;

    final tempImage = File(pickedFile.path);
    setState(() {
      selectedImage = tempImage;
      print('image got selected');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Upload_Image(image: selectedImage)));
    });


    selectedImage = tempImage;
    if (selectedImage != null) {
      print('jello world');
    }

  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Capture(camera: capture),
              SizedBox(
                height: 50,
              ),
              Browse(gallery: capture)
            ],

          child: Container(
            height: 70,
            width: screenWidth - 80,
            padding: const EdgeInsets.all(7),
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Container(
                      width: 100,
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Capture(camera: capture),
                          const SizedBox(
                            width: 30,
                          ),
                          Browse(
                            gallery: capture,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.image,
                color: Colors.white,
                size: 32,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 96, 160)),
              label: Text(
                'Select Image',
                style: GoogleFonts.breeSerif(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
