// ignore_for_file: camel_case_types
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:project1/screens/registration_onboarding_screen.dart';
import '../Functions/userdata.dart';

class Fetched_Image extends StatelessWidget {
  const Fetched_Image({Key? key, required this.imageTitle}) : super(key: key);
  final String imageTitle;

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 96, 160),
          actions: [
            TextButton(
                onPressed: () {
                  deletePhotoFromDrive(folder_Id!, imageTitle);
                  titles_list.remove(imageTitle);

                  Timer(const Duration(seconds: 1), () {
                    Navigator.pop(context, true);

                    //   Navigator.popUntil(context, ModalRoute.withName('/'));
                    //   // Navigator.popAndPushNamed(context, '(context) => History_page()');
                    //   // Navigator.pushReplacement(
                    //   //   context,
                    //   //   MaterialPageRoute(
                    //   //       builder: (context) =>  History_page()),
                    //   // );
                  });
                },
                child: Text(
                  'DELETE',
                  style:
                      GoogleFonts.breeSerif(color: Colors.white, fontSize: 16),
                )),
          ]),
      body: Center(
        child: Container(
          width: screenwidth - 30,
          alignment: Alignment.center,
          child: FutureBuilder<Uint8List>(
            future: fetchImageFromDrive(imageTitle),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  strokeWidth: 4,
                  color: Colors.white,
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return PhotoView(
                  imageProvider: MemoryImage(snapshot.data!),
                  minScale: PhotoViewComputedScale.contained * 0.97,
                );
              } else {
                return const Text('Image not found');
              }
            },
          ),
        ),
      ),
    );
  }
}
