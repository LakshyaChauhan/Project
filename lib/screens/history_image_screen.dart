import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

import '../Functions/userdata.dart';



class Fetched_Image extends StatelessWidget {
  Fetched_Image({Key? key,required this.imageTitle }) : super(key: key);
  var imageTitle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Image Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Image'),
        ),
        body: Center(
          child: FutureBuilder<Uint8List>(
            future: fetchImageFromDrive(imageTitle),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Image.memory(snapshot.data!);
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
