import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:project1/upload_image.dart';

class Capture extends StatelessWidget {
  const Capture({super.key, required this.camera
  });

  final void Function(ImageSource) camera;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return  Container(
      height: 70,
      width: screenWidth - 80,
      padding: const EdgeInsets.all(7),
      child: ElevatedButton.icon(
        onPressed: () {
          camera(ImageSource.camera);
        },
        icon: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
          size: 32,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 96, 160)),
        label: Text(
          'Real time capture',
          style: GoogleFonts.breeSerif(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20),
        ),
      ),
    );
  }
}
