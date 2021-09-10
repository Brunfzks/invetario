import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height / 5, size.width * 0.85,
        size.height * 0.19);
    path.cubicTo(size.width * 0.74, size.height * 0.18, size.width / 3,
        size.height * 0.19, size.width * 0.12, size.height * 0.19);
    path.cubicTo(size.width * 0.05, size.height * 0.19, 0, size.height * 0.31,
        0, size.height * 0.46);
    path.cubicTo(
        0, size.height * 0.46, 0, size.height * 0.46, 0, size.height * 0.46);
    path.cubicTo(0, size.height * 0.61, size.width * 0.05, size.height * 0.73,
        size.width * 0.12, size.height * 0.74);
    path.cubicTo(size.width * 0.12, size.height * 0.74, size.width * 0.86,
        size.height * 0.75, size.width * 0.86, size.height * 0.75);
    path.cubicTo(size.width * 0.86, size.height * 0.75, size.width * 0.86,
        size.height * 0.75, size.width * 0.86, size.height * 0.75);
    path.cubicTo(size.width * 0.88, size.height * 0.76, size.width,
        size.height * 0.74, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height, size.width,
        size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
