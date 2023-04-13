import 'package:app_one/coffee_app/global/styles.dart';
import 'package:flutter/material.dart';

import '../../domain/models/coffee.dart';
import '../alternative/alternative_screen.dart';

class FrozenCard extends StatefulWidget {
  const FrozenCard({super.key, required this.frozen});
  final Coffee frozen;
  static const double height = 150;

  @override
  State<FrozenCard> createState() => _FrozenCardState();
}

class _FrozenCardState extends State<FrozenCard> {
  final _animationDuration = const Duration(milliseconds: 1500);
  bool _animated = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _animated = !_animated;
          if (_animated) {
            Future.delayed(_animationDuration, () {
              setState(() {
                _animated = false;
              });
            });
          }
        });

        Future.delayed(
          const Duration(milliseconds: 600),
          () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 600),
                pageBuilder: (_, animation, animation2) {
                  return FadeTransition(
                    opacity: animation,
                    child: AlternativeScreen(frozen: widget.frozen),
                  );
                },
              ),
            );
          },
        );
      },
      child: TweenAnimationBuilder<double>(
        key: Key(_animated.toString()),
        duration: _animationDuration,
        tween: Tween(begin: _animated ? 0 : 1, end: 1),
        builder: (context, value, child) {
          return Transform.scale(
            scale:
                (2 - const ElasticOutCurve(.5).transform(value)).clamp(.8, 1),
            child: SizedBox(
              height: FrozenCard.height,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Stack(
                  children: [
                    Positioned.fill(
                        bottom: 40,
                        right: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryColor.withOpacity(.8),
                          ),
                        )),
                    Positioned(
                        top: 10,
                        left: 10,
                        bottom: 50,
                        child: Hero(
                          tag: widget.frozen.name,
                          child: Center(
                            child: Container(
                                margin: EdgeInsets.zero,
                                width: 90,
                                height: 90,
                                child: Image.asset(widget.frozen.imgUrls[0])),
                          ),
                        )),
                    Positioned(
                      bottom: FrozenCard.height / 2,
                      right: 10,
                      child: Text(widget.frozen.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontFamily: 'CRegular')),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Text('Special price : \$ ${widget.frozen.price}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontFamily: 'CRegular')),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
