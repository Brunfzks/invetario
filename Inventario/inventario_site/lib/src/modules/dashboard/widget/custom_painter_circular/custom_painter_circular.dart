import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math.dart' as vmath;

class CircularCustomPainter extends CustomPainter {
  double porcentagem;
  CircularCustomPainter({
    required this.porcentagem,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height/1.5);

    canvas.drawCircle(
      center,
      35,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black12
        ..strokeWidth = 20,
    );
    canvas.saveLayer(
      Rect.fromCenter(center: center, width: 100, height: 100),
      // Paint()..blendMode = BlendMode.dstIn,
      Paint(),
    );
    canvas.drawArc(
      Rect.fromCenter(center: center, width: 70, height: 70),
      vmath.radians(0),
      vmath.radians((porcentagem /100) * 360),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Colors.green[100]!
        ..strokeWidth = 20,
    );

    canvas.drawArc(
      Rect.fromCenter(center: center, width: 55, height: 55),
      vmath.radians(0),
      vmath.radians(360),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Colors.green
        ..strokeWidth = 15
        ..blendMode = BlendMode.srcIn,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
