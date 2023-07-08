import 'dart:convert';

import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:project1/screens/registration_onboarding_screen.dart';
 //late List simplified;

Future <Uint8List?> fetchImage(String imagePath) async {
  var headers = {'Content-Type': 'application/json'};
  var body = json.encode({'folderId': folder_Id});
  var url = Uri.parse('http://192.168.212.194:5000/endpoint');
  http.post(url , headers: headers, body: body);
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://192.168.212.194:5000/image-size'));
  request.files.add(await http.MultipartFile.fromPath('image', imagePath));

  // request.fields['folderId']=folder_Id.toString();

  var response = await request.send();
  if (response.statusCode == 200) {
    final img_response = await response.stream.toBytes();
     return img_response;
    //var data = await json.decode(response.stream.toBytes() as String );
   //  var responseData = await response.stream.toBytes();
   //
   //  var data = utf8.decode(responseData);
   //  var decodedData = json.decode(data);
   //  print(decodedData);
   //
   // return decodedData;

    // var uint8ListData = Uint8List.fromList(simplifiedData);





     //return uint8ListData;



  } else {
    throw Exception('Failed to fetch image size');
  }
}

// Future<Uint8List> fetchImage(String imagePath) async {
//   var request = http.MultipartRequest(
//       'POST', Uri.parse('http://192.168.212.194:5000/image-size'));
//   request.files.add(await http.MultipartFile.fromPath('image', imagePath));
//
//   var response = await request.send();
//   if (response.statusCode == 200) {
//      final img_response = await response.stream.toBytes();
//      return img_response;
//
//
//
//   } else {
//     throw Exception('Failed to fetch image size');
//   }
// }