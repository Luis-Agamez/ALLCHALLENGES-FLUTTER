import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.size,
  });

  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 2,
              blurRadius: 0,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: const CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,
        foregroundImage: AssetImage('assets/bankImg/photo.jpg'),
      ),
    );
  }
}
