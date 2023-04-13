import 'dart:math';

import 'package:flutter/material.dart';

class MyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: DolDurmaClipper(right: 40, holeRadius: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.blueAccent,
                  ),
                  width: 300,
                  height: 95,
                  padding: const EdgeInsets.all(15),
                  child: const Text('first example'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipPath(
                clipper: DolDurmaClipper(right: 100, holeRadius: 40),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.amber,
                  ),
                  width: 200,
                  height: 250,
                  padding: const EdgeInsets.all(35),
                  child: const Text('second example'),
                ),
              ),
            ]),
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({required this.right, required this.holeRadius});

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 00),
        clockwise: false,
        radius: const Radius.elliptical(2, 4),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}
