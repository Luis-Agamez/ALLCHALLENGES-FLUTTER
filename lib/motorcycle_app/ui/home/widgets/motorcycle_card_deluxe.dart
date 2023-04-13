import 'package:flutter/material.dart';

import '../../../domain/models/motorcycle.dart';

class MotorcycleCardDeluxe extends StatefulWidget {
  static const double height = 340;
  const MotorcycleCardDeluxe({Key? key, required this.motorcycle, this.onTap})
      : super(key: key);

  final Motorcycle motorcycle;
  final VoidCallback? onTap;
  @override
  State<MotorcycleCardDeluxe> createState() => _MotorcycleCardState();
}

class _MotorcycleCardState extends State<MotorcycleCardDeluxe> {
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
            widget.onTap?.call,
          );
        },
        child: TweenAnimationBuilder<double>(
          key: Key(_animated.toString()),
          duration: _animationDuration,
          tween: Tween(begin: _animated ? 0 : 1, end: 1),
          builder: (context, double value, _) {
            return Transform.scale(
              scale:
                  (2 - const ElasticOutCurve(.5).transform(value)).clamp(.8, 1),
              child: SizedBox(
                height: MotorcycleCardDeluxe.height,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: MotorcycleCardDeluxe.height / 2 - 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blueGrey.withOpacity(0.3),
                          ),
                        )),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.motorcycle.maker,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueGrey.withOpacity(0.9)),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  widget.motorcycle.name,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(255, 24, 20, 20)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${widget.motorcycle.price / 12} / Week',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0XFFFF7B01)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.star_outlined,
                                          size: 32,
                                          color: Colors.grey[350],
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          '4.2',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 24, 20, 20)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        )),
                    const Positioned(
                        top: 20,
                        right: 20,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.black,
                          size: 32,
                        )),
                    Positioned(
                        top: MotorcycleCardDeluxe.height / 4 - 40,
                        left: 10,
                        child: Hero(
                            tag: widget.motorcycle.name,
                            child: Image.asset(widget.motorcycle.images[0],
                                height: 150)))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
