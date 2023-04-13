import 'package:app_one/coffee_app/global/styles.dart';
import 'package:flutter/material.dart';

import '../home/coffee_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationControllerCircles;
  late Animation<double> _backgroundAnimation;
  late Animation<double> _backgroundAnimationCircle1;
  late Animation<double> _backgroundAnimationCircle2;
  late Animation<double> _backgroundAnimationCircle3;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animationControllerCircles = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _animationController.forward();
    _animationControllerCircles.forward();

    _backgroundAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    );

    _backgroundAnimationCircle1 = CurvedAnimation(
        parent: _animationControllerCircles,
        curve: const Interval(0.0, 0.33, curve: Curves.linear));

    _backgroundAnimationCircle2 = CurvedAnimation(
        parent: _animationControllerCircles,
        curve: const Interval(0.33, 0.66, curve: Curves.linear));

    _backgroundAnimationCircle3 = CurvedAnimation(
        parent: _animationControllerCircles,
        curve: const Interval(0.66, 0.99, curve: Curves.linear));

    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.repeat();
      }
    });

    _animationControllerCircles.addListener(() {
      if (_animationControllerCircles.isCompleted) {
        _animationControllerCircles.repeat();
      }
    });

    Future.delayed(
      const Duration(milliseconds: 2400),
      () {
        return Navigator.of(context).push(PageRouteBuilder(
            transitionsBuilder: ((context, animation, _, child) {
              return FadeTransition(opacity: animation, child: child);
            }),
            pageBuilder: ((
              context,
              _,
              __,
            ) =>
                const CoffeeHomeScreen())));
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController.removeListener(() {});
    _animationControllerCircles.removeListener(() {});
    _animationControllerCircles.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => Transform.scale(
                scale: (.2 + (.7 * _backgroundAnimation.value)),
                child: Opacity(
                    opacity: .4 + (.6 * _backgroundAnimation.value),
                    child: Image.asset('assets/coffeeImg/splash.png'))),
          ),
          AnimatedBuilder(
            animation: _animationControllerCircles,
            builder: (context, child) {
              return Container(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Opacity(
                      opacity: (1 - _backgroundAnimationCircle1.value),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primaryColor),
                      ),
                    ),
                    Opacity(
                      opacity: (1 - _backgroundAnimationCircle2.value),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primaryColor),
                      ),
                    ),
                    Opacity(
                      opacity: (1 - _backgroundAnimationCircle3.value),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primaryColor),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
