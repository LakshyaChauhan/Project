import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:photo_view/photo_view.dart';

import '../Functions/userdata.dart';



class Fetched_Image extends StatelessWidget {
  Fetched_Image({Key? key,required this.imageTitle }) : super(key: key);
  String imageTitle;


@override

  Widget build(BuildContext context) {
  final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: screenwidth-30,
          alignment: Alignment.center,
          child: FutureBuilder<Uint8List>(
            future: fetchImageFromDrive(imageTitle),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(
                  strokeWidth: 4,
                  color: Colors.white,
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return PhotoView(
                  imageProvider: MemoryImage(snapshot.data!),
                      minScale: PhotoViewComputedScale.contained *0.97,

                );
              } else {
                return Text('Image not found');
              }
            },
          ),
        ),
      ),
    );

  }
}
