import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Browse extends StatelessWidget {
  const Browse({super.key, required this.gallery});

  final void Function(ImageSource) gallery;

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
          gallery(ImageSource.gallery);
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Browse',
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
