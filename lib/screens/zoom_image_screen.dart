import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ZoomImage extends StatelessWidget {
  const ZoomImage({Key? key, required this.image}) : super(key: key);
  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PhotoView(
        imageProvider: MemoryImage(image),
        minScale: PhotoViewComputedScale.contained * 0.80,
        initialScale: PhotoViewComputedScale.contained * 0.80,
      ),
    );
  }
}
