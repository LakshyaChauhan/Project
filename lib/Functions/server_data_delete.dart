
import 'dart:typed_data';

// ignore_for_file: non_constant_identifier_names, unused_local_variable


import 'package:http/http.dart' as http;


void DeleteServerData(String fid) async {

  String stringValue = fid;


  var url = 'http://192.168.212.194:5000/delete';

  var url = 'http://192.168.43.37:5000/delete';

  var response = await http.post(
    Uri.parse(url),
    body: {
      'stringValue': stringValue,
    },
  );
  // if (response.statusCode == 200) {
  //   final img_response = await response.bodyBytes;
  //   return img_response;
  //
  //
  //
  // } else {
  //   throw Exception('Failed to fetch image size');
  // }

  // Handle the response as needed
  // if (response.statusCode == 200) {
  //   print('Data sent successfully');
  // } else {
  //   print('Error sending data: ${response.statusCode}');
  // }
}