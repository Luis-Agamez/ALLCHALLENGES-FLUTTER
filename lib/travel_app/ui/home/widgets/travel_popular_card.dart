import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../domain/models/travel_model.dart';

class TravelPopularCard extends StatelessWidget {
  const TravelPopularCard({
    super.key,
    required this.size,
    required this.travel,
    required this.haveFocus,
  });

  final Size size;
  final Travel travel;
  final bool haveFocus;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 600);
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: 1, end: haveFocus ? 0 : 1),
      builder: (_, double value, __) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          width: size.width * .8,
          height: size.height * .2,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: size.height * .2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.asset(
                        travel.images[1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Positioned(
                  left: 20,
                  right: 20,
                  bottom: size.height * .07,
                  child: Transform.translate(
                    offset: Offset(0, -80 * value),
                    child: ClipRect(
                      child: Container(
                        margin: EdgeInsets.zero,
                        height: size.height * .08,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(.1),
                                  ]),
                              border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('Explore your beauty',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w700)),
                                      Text('Get special offers and discounts',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color.fromARGB(255, 243, 108, 11),
                                    size: 28,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                top: 10,
                left: 10,
                child: Transform.translate(
                  offset: Offset(0, -60 * value),
                  child: ClipRect(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Text(
                            travel.country,
                            style: const TextStyle(
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
