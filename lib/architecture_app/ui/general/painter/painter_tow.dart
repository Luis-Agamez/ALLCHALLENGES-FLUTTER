import 'package:flutter/material.dart';

class PainterTwo extends CustomPainter {
  PainterTwo();

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
      ..moveTo(0, 0)
      ..cubicTo(size.width * .0, size.height * 0, size.width * .8,
          size.height * .38, size.width, size.height * .34)
      ..lineTo(size.width, size.height / 1)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
