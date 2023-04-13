import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key, required this.screenName, required this.screen});
  final String screenName;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, animation, __) {
              return FadeTransition(opacity: animation, child: screen);
            },
          ),
        );
      },
      child: Container(
        width: size.width * .6,
        height: size.height * .08,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Center(
            child: Text(
          screenName,
          style: const TextStyle(
              color: Colors.black,
              letterSpacing: 1,
              fontFamily: 'CRegular',
              fontSize: 28,
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
