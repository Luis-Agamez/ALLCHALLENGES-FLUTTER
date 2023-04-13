import 'package:app_one/coffee_app/global/styles.dart';
import 'package:flutter/material.dart';

class ScreenPainter extends CustomPainter {
  ScreenPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [backgroundColorLight, backgroundColorLight],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromCenter(
          center: Offset(0, height * .6),
          width: size.width,
          height: size.height,
        ),
      );

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(width * .2, 0)
      ..lineTo(width * .2, height * .2)
      ..cubicTo(width * .2, height * .5, width * .3, height * .6, width * 5,
          height * .1)
      ..lineTo(width, height * .2)
      ..lineTo(width, height)
      ..lineTo(0, height);

    canvas..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
