import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key, required this.gallery});

  final void Function() gallery;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
        ))),
        onPressed: gallery,
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

