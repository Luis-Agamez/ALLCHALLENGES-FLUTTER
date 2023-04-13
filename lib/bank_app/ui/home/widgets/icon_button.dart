import 'dart:math';

import 'package:flutter/material.dart';

import '../../constant.dart';

class IconButtom extends StatelessWidget {
  final Icon icon;
  final String label;
  final bool reverse;
  const IconButtom({
    super.key,
    required this.icon,
    required this.label,
    required this.reverse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Transform.rotate(
            angle: reverse ? -pi * 1 : 0,
            child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: backgroundColorLigth,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: icon),
          ),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'PRegular',
                letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
