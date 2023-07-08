// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
// import 'package:project1/screens/registration_onboarding_screen.dart';
//late List simplified;

Future<Uint8List?> ImageText(String count) async {
  var headers = {'Content-Type': 'application/json'};
  var body = json.encode({'count': count});
  var url = Uri.parse('http://192.168.212.194:5000/count');
  var response = await http.post(url, headers: headers, body: body);
  if (response.statusCode == 200) {
     final img_response =  response.bodyBytes;
     return img_response;



  } else {
    throw Exception('Failed to fetch image size');
  }
}


// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'fetch_Image_size.dart';
// Future<Uint8List> fetchImage(String imagePath) async {
//   var request = http.MultipartRequest(
//       'POST', Uri.parse('http://192.168.212.194:5000/image-size'));
//   request.files.add(await http.MultipartFile.fromPath('image', imagePath));
//   request.files.add(await http.MultipartFile.fromString('simplified', simplified as String));
//
//   var response = await request.send();
//   if (response.statusCode == 200) {
//     final img_response = await response.stream.toBytes();
//     return img_response;
//
//
//
//   } else {
//     throw Exception('Failed to fetch image size');
//   }
// }