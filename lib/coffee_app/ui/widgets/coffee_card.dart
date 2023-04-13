import 'package:app_one/coffee_app/ui/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/models/coffee.dart';
import '../../global/styles.dart';

class CoffeCard extends StatefulWidget {
  final Coffee coffee;
  const CoffeCard({super.key, required this.coffee});
  static const double height = 360;

  @override
  State<CoffeCard> createState() => _CoffeCardState();
}

class _CoffeCardState extends State<CoffeCard> {
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
                    child: DetailsScreen(
                      coffee: widget.coffee,
                    ),
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
                (2 - const ElasticOutCurve(.5).transform(value)).clamp(.8, .95),
            child: SizedBox(
              height: CoffeCard.height,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        left: 10,
                        bottom: 100,
                        child: Center(
                          child: Container(
                              padding: EdgeInsets.zero,
                              width: 200,
                              height: 200,
                              child: Hero(
                                  tag: widget.coffee.name,
                                  child:
                                      Image.asset(widget.coffee.imgUrls[0]))),
                        )),
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Text(widget.coffee.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontFamily: 'CRegular')),
                    ),
                    Positioned(
                        bottom: -10,
                        right: -10,
                        child: Container(
                          margin: const EdgeInsets.only(right: 22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryColor,
                          ),
                          height: 30,
                          width: 60,
                          child: Center(
                            child: Text(
                              '\$${widget.coffee.price}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'PMedium',
                              ),
                            ),
                          ),
                        ))
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
