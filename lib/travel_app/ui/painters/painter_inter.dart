import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PainterInter extends CustomPainter {
  ui.Image? image;
  PainterInter({
    required this.curveRadius,
    this.image,
  });
  final double curveRadius;

  @override
  void paint(Canvas canvas, Size size) {
    print(size.height);
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color.fromARGB(0, 87, 255, 3),
          Color.fromARGB(255, 7, 118, 103).withOpacity(1)
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
      ..cubicTo(
        size.width * -0.05,
        size.width * .70,
        size.width * 0.05,
        size.width * .81,
        size.width * .3,
        size.width * .84,
      )
      ..quadraticBezierTo(
        size.width * 0,
        size.height - (curveRadius),
        size.width * 0.5,
        size.height - (curveRadius),
      )
      ..lineTo(size.width * .3, size.height - (curveRadius))
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
      // ..drawImage(image!, const Offset(0, 0), paint)
      ..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
