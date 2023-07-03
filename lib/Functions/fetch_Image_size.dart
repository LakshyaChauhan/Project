import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<Uint8List> fetchImage(String imagePath) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://192.168.43.37:5000/image-size'));
  request.files.add(await http.MultipartFile.fromPath('image', imagePath));

  var response = await request.send();
  if (response.statusCode == 200) {
     final img_response = await response.stream.toBytes();
     return img_response;



  } else {
    throw Exception('Failed to fetch image size');
  }
}