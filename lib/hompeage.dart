import 'package:flutter/material.dart';
import 'package:project1/widgets/browse.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:project1/widgets/capture.dart';
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
              builder: (context) => UploadImage(image: selectedImage)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Project'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Capture(camera: capture),
              const SizedBox(
                height: 50,
              ),
              Browse(gallery: capture),
            ],
          ),
        ));
  }
}
