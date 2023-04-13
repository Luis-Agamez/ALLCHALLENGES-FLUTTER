import 'package:flutter/material.dart';

class PainterDecoration extends CustomPainter {
  PainterDecoration({required this.curveRadius});
  final double curveRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.blue, Colors.blueAccent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromCenter(
          center: Offset(0, size.height * .6),
          width: size.width,
          height: size.height,
        ),
      );

    final path = Path()
      ..lineTo(0, size.height - 60)
      ..quadraticBezierTo(
        0,
        size.height - curveRadius,
        curveRadius,
        size.height - curveRadius,
      )
      ..lineTo(size.width * .5, size.height - curveRadius)
      ..cubicTo(
        size.width,
        size.width * .85,
        size.width,
        size.height - 20,
        size.width + 50,
        size.height + 500,
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
    canvas
      ..drawShadow(path, Colors.black26, 10, false)
      ..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
