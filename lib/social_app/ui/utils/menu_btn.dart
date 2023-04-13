import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../home/home_screen.dart';

class MenuBtn extends StatelessWidget {
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  const MenuBtn({
    Key? key,
    required this.press,
    required this.riveOnInit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(left: 16, top: 40),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: HomeScreenSocialApp.primaryColor,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 3), blurRadius: 8)
              ]),
          child: RiveAnimation.asset(
            'assets/RiveAssets/menu_button.riv',
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
