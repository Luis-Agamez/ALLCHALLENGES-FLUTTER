import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rive/rive.dart';

import '../home/home_screen.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Socialne',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'PBold',
                letterSpacing: 1,
                fontSize: 26),
          ),
          Row(
            children: const [
              SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimation.asset(
                  'assets/RiveAssets/icons.riv',
                  artboard: 'BELL',
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimation.asset(
                  'assets/RiveAssets/icons.riv',
                  artboard: 'CHAT',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
