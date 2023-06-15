import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Browse extends StatelessWidget {
  const Browse({super.key, required this.gallery});

  final void Function(ImageSource) gallery;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 70,
      width: screenWidth - 80,
      padding: const EdgeInsets.all(7),
      child: ElevatedButton.icon(
        onPressed: () {
          gallery(ImageSource.gallery);
        },
        icon: const Icon(
          Icons.image,
          color: Colors.white,
          size: 32,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 96, 160)),
        label: Text(
          'Browse Image',
          style: GoogleFonts.breeSerif(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20),
        ),
      ),
    );
  }
}
