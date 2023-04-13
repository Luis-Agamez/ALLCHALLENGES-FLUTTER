import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      width: width,
      height: height,
      child: Image.asset(
        'assets/img/background.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
