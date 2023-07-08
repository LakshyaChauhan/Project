
import 'dart:typed_data';

import 'package:http/http.dart' as http;

// ...

Future<Uint8List?> Fetch_Drawed_Image(String fid,int count) async {
  int intValue = count;
  String stringValue = fid;

  var url = 'http://192.168.212.194:5000/count';
  var response = await http.post(
    Uri.parse(url),
    body: {
      'intValue': intValue.toString(),
      'stringValue': stringValue,
    },
  );
  if (response.statusCode == 200) {
    final img_response = await response.bodyBytes;
    return img_response;



  } else {
    throw Exception('Failed to fetch image size');
  }

  // Handle the response as needed
  // if (response.statusCode == 200) {
  //   print('Data sent successfully');
  // } else {
  //   print('Error sending data: ${response.statusCode}');
  // }
}


// import 'dart:convert';
//
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:http/http.dart' as http;
//
// Future<List> fetchImage2(String imagePath) async {
//   var request = http.MultipartRequest(
//       'POST', Uri.parse('http://192.168.212.194:5000/image-size'));
//   request.files.add(await http.MultipartFile.fromPath('image', imagePath));
//
//   var response = await request.send();
//   if (response.statusCode == 200) {
//      final simplified = await response.stream.toBytes();
//      return simplified;
//
//
//
//   } else {
//     throw Exception('Failed to fetch image ');
//   }
// }