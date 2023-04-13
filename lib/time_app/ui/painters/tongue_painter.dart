import 'dart:ui';

import 'package:flutter/material.dart';

class TonguePainter extends CustomPainter {
  TonguePainter({required this.curveRadius});
  final double curveRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey.shade200.withOpacity(.4);

    final path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        0,
        size.height - curveRadius,
        curveRadius,
        size.height - curveRadius,
      )
      ..lineTo(size.width * .3, size.height - curveRadius)
      ..cubicTo(
        size.width * .42,
        size.height - curveRadius,
        size.width * .41,
        size.height,
        size.width * .5,
        size.height,
      )
      ..cubicTo(
        size.width * .59,
        size.height,
        size.width * .59,
        size.height - curveRadius,
        size.width * .7,
        size.height - curveRadius,
      )
      ..lineTo(size.width - curveRadius, size.height - curveRadius)
      ..quadraticBezierTo(
        size.width,
        size.height - curveRadius,
        size.width,
        size.height,
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
    canvas..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
