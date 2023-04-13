import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  Painter();

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
      ..moveTo(0, size.height / 2)
      ..cubicTo(size.width * .0, size.height / 1.6, size.width * .05,
          size.height / 3, size.width, size.height / 1)
      ..lineTo(size.width, size.height / 1)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
