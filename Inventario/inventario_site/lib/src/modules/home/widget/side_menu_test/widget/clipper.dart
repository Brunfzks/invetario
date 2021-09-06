import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    final double _xScaling = size.width / 250;
    final double _yScaling = size.height / 681;
    path.lineTo(252 * _xScaling, 646.0500000000001 * _yScaling);
    path.cubicTo(
      252 * _xScaling,
      646.0500000000001 * _yScaling,
      252 * _xScaling,
      307.8 * _yScaling,
      252 * _xScaling,
      307.8 * _yScaling,
    );
    path.cubicTo(
      252.00071387717202 * _xScaling,
      294.642186508959 * _yScaling,
      241.4070996332347 * _xScaling,
      283.93706062810526 * _yScaling,
      228.25 * _xScaling,
      283.8 * _yScaling,
    );
    path.cubicTo(
      228.25 * _xScaling,
      283.8 * _yScaling,
      59.25 * _xScaling,
      282.28000000000003 * _yScaling,
      59.25 * _xScaling,
      282.28000000000003 * _yScaling,
    );
    path.cubicTo(
      45.9114836762417 * _xScaling,
      282.13806438767557 * _yScaling,
      35.2480174419252 * _xScaling,
      271.1466985636056 * _yScaling,
      35.510000000000005 * _xScaling,
      257.81000000000006 * _yScaling,
    );
    path.cubicTo(
      35.510000000000005 * _xScaling,
      257.81000000000006 * _yScaling,
      35.510000000000005 * _xScaling,
      257.52000000000004 * _yScaling,
      35.510000000000005 * _xScaling,
      257.52000000000004 * _yScaling,
    );
    path.cubicTo(
      35.798200262406624 * _xScaling,
      244.47258733963687 * _yScaling,
      46.45940513608771 * _xScaling,
      234.04680327010033 * _yScaling,
      59.510000000000005 * _xScaling,
      234.05 * _yScaling,
    );
    path.cubicTo(
      59.510000000000005 * _xScaling,
      234.05 * _yScaling,
      228.03 * _xScaling,
      234.05 * _yScaling,
      228.03 * _xScaling,
      234.05 * _yScaling,
    );
    path.cubicTo(
      241.28483399593904 * _xScaling,
      234.05 * _yScaling,
      252.03 * _xScaling,
      223.30483399593905 * _yScaling,
      252.03 * _xScaling,
      210.05 * _yScaling,
    );
    path.cubicTo(
      252.03 * _xScaling,
      210.05 * _yScaling,
      252.03 * _xScaling,
      36.6 * _yScaling,
      252.03 * _xScaling,
      36.6 * _yScaling,
    );
    path.cubicTo(
      252.03250743540804 * _xScaling,
      34.78927182305301 * _yScaling,
      251.82784331910423 * _xScaling,
      32.984201418513244 * _yScaling,
      251.42 * _xScaling,
      31.22 * _yScaling,
    );
    path.cubicTo(
      243.96 * _xScaling,
      -0.2999999999999998 * _yScaling,
      218.19 * _xScaling,
      -0.16999999999999993 * _yScaling,
      214.45 * _xScaling,
      0.020000000000000018 * _yScaling,
    );
    path.cubicTo(
      214.07 * _xScaling,
      0.020000000000000018 * _yScaling,
      213.45 * _xScaling,
      0.020000000000000018 * _yScaling,
      213.07 * _xScaling,
      0.020000000000000018 * _yScaling,
    );
    path.cubicTo(
      213.07 * _xScaling,
      0.020000000000000018 * _yScaling,
      23.96 * _xScaling,
      0.020000000000000018 * _yScaling,
      23.96 * _xScaling,
      0.020000000000000018 * _yScaling,
    );
    path.cubicTo(
      22.95701919179449 * _xScaling,
      0.02089709357605063 * _yScaling,
      21.95508004338136 * _xScaling,
      0.08435361656773188 * _yScaling,
      20.96 * _xScaling,
      0.20999999999999996 * _yScaling,
    );
    path.cubicTo(
      20.96 * _xScaling,
      0.20999999999999996 * _yScaling,
      20.96 * _xScaling,
      0.050000000000000044 * _yScaling,
      20.96 * _xScaling,
      0.050000000000000044 * _yScaling,
    );
    path.cubicTo(
      20.96 * _xScaling,
      0.050000000000000044 * _yScaling,
      -0.03999999999999915 * _xScaling,
      0.050000000000000044 * _yScaling,
      -0.03999999999999915 * _xScaling,
      0.050000000000000044 * _yScaling,
    );
    path.cubicTo(
      -0.03999999999999915 * _xScaling,
      0.050000000000000044 * _yScaling,
      -0.03999999999999915 * _xScaling,
      680.0500000000001 * _yScaling,
      -0.03999999999999915 * _xScaling,
      680.0500000000001 * _yScaling,
    );
    path.cubicTo(
      -0.03999999999999915 * _xScaling,
      680.0500000000001 * _yScaling,
      21.71 * _xScaling,
      680.0500000000001 * _yScaling,
      21.71 * _xScaling,
      680.0500000000001 * _yScaling,
    );
    path.cubicTo(
      22.42 * _xScaling,
      680.1200000000001 * _yScaling,
      23.130000000000003 * _xScaling,
      680.1600000000001 * _yScaling,
      23.85 * _xScaling,
      680.1600000000001 * _yScaling,
    );
    path.cubicTo(
      23.85 * _xScaling,
      680.1600000000001 * _yScaling,
      213.78 * _xScaling,
      681.0400000000001 * _yScaling,
      213.78 * _xScaling,
      681.0400000000001 * _yScaling,
    );
    path.cubicTo(
      215.39815486437865 * _xScaling,
      681.0515498116205 * _yScaling,
      217.0132399131758 * _xScaling,
      680.8974129646414 * _yScaling,
      218.6 * _xScaling,
      680.58 * _yScaling,
    );
    path.cubicTo(
      252.95 * _xScaling,
      673.6800000000001 * _yScaling,
      252 * _xScaling,
      646.0500000000001 * _yScaling,
      252 * _xScaling,
      646.0500000000001 * _yScaling,
    );
    path.cubicTo(
      252 * _xScaling,
      646.0500000000001 * _yScaling,
      252 * _xScaling,
      646.0500000000001 * _yScaling,
      252 * _xScaling,
      646.0500000000001 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
