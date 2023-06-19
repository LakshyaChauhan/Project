import 'package:http/http.dart' as http;

Future<String> fetchImageSize(String imagePath) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://172.16.179.216:5000/image-size'));
  request.files.add(await http.MultipartFile.fromPath('image', imagePath));

  var response = await request.send();
  if (response.statusCode == 200) {
    return await response.stream.bytesToString();
  } else {
    throw Exception('Failed to fetch image size');
  }
}
