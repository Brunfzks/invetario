import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomClipperLogin extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    final double _xScaling = size.width / 581;
    final double _yScaling = size.height / 681;
    path.lineTo(250.41 * _xScaling, 316.56 * _yScaling);
    path.cubicTo(
      409.42999999999995 * _xScaling,
      387.91 * _yScaling,
      537.24 * _xScaling,
      406.21000000000004 * _yScaling,
      580.34 * _xScaling,
      680.91 * _yScaling,
    );
    path.cubicTo(
      580.34 * _xScaling,
      680.91 * _yScaling,
      0 * _xScaling,
      680.91 * _yScaling,
      0 * _xScaling,
      680.91 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      680.91 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      91.4 * _xScaling,
      245.22 * _yScaling,
      250.41 * _xScaling,
      316.56 * _yScaling,
    );
    path.cubicTo(
      250.41 * _xScaling,
      316.56 * _yScaling,
      250.41 * _xScaling,
      316.56 * _yScaling,
      250.41 * _xScaling,
      316.56 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
