import 'package:flutter/material.dart';

class PaintBorder extends CustomPainter {
  PaintBorder({required this.curveRadius});
  final double curveRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [const Color(0XFF1B1E28), const Color(0XFF1B1E28)],
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
      ..lineTo(0, size.height)
      ..cubicTo(0, size.height - 40, size.width * 0.05, size.height - 55,
          size.width * 0.12, size.height - 60)
      ..lineTo(size.width * 0.12, size.height - 60)
      ..quadraticBezierTo(size.width * .5, size.height - 80, size.width * 0.86,
          size.height - 60)
      ..cubicTo(size.width * 0.93, size.height - 55, size.width * 0.98,
          size.height - 60, size.width, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);
    canvas..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
