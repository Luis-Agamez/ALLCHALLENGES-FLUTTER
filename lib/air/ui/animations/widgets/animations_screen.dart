import 'dart:math';

import 'package:flutter/material.dart';

import '../../details/air_details_screen.dart';
import '../../home/air_home_screen.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _animation = true;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 8000));

    _animationController.forward();
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Navigator.pushReplacement(context, PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const AirHomeScreen();
          },
        ));
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/airImg/backg.png',
            fit: BoxFit.cover,
          )),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInBack,
                tween: Tween(begin: 0, end: _animation ? 1 : 0),
                onEnd: () {
                  setState(() {
                    _animation = !_animation;
                  });
                },
                builder: (context, double value, child) {
                  return AnimatedPositioned(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 1000),
                    top: size.height * .5 + (500 * value),
                    left: size.width * .1,
                    child: Center(
                        child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..scale(
                          0.1 + 8 * _animationController.value,
                        )
                        ..rotateZ(pi * .24 * value),
                      child: Container(
                          margin: EdgeInsets.zero,
                          width: size.width * .8,
                          height: size.height * .2,
                          child: Image.asset('assets/airImg/front.png')),
                    )),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
