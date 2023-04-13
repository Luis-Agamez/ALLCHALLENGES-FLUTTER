import 'package:flutter/material.dart';

class PainterOptional extends CustomPainter {
  PainterOptional({required this.curveRadius});
  final double curveRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255)
        ],
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
      ..lineTo(0, -size.height * .25)
      ..cubicTo(
        size.width * 0.04,
        -size.height * .10,
        size.width * 0.02,
        -size.height * 0.01,
        size.width * 0.30,
        0,
      )
      ..lineTo(size.width * 0.70, 0)
      ..cubicTo(size.width * 0.90, size.height * 0.01, size.width * 0.992,
          size.height * .10, size.width * 1, size.height * .25)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    canvas..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
