import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:project1/upload_image.dart';

class Capture extends StatelessWidget {
  const Capture({super.key, required this.camera});

  final void Function(ImageSource) camera;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
        ))),
        onPressed: () {
          camera(ImageSource.camera);

        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt_outlined,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Camera',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
