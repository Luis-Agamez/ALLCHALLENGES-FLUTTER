import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../domain/models/travel_model.dart';
import '../../details/details_screen.dart';

class TravelCard extends StatelessWidget {
  const TravelCard(
      {Key? key,
      required this.travel,
      required this.haveFocus,
      required this.factorChange,
      required this.animateFactor})
      : super(key: key);

  final Travel travel;
  final bool haveFocus;
  final double factorChange;
  final double animateFactor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const duration = Duration(milliseconds: 600);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, animation, __) {
              return FadeTransition(
                  opacity: animation, child: DetailsScreen(travel: travel));
            },
          ),
        );
      },
      child: TweenAnimationBuilder<double>(
        duration: duration,
        tween: Tween(begin: 0, end: haveFocus ? 1 : 0),
        builder: (_, double value, __) {
          return Container(
            width: size.width * animateFactor,
            height: size.height * animateFactor,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(bottom: 120.0 * factorChange),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(travel.images[0], fit: BoxFit.cover),
                const _ShaderCard(),
                AnimatedPositioned(
                    duration: duration,
                    top: 0,
                    left: 10 * animateFactor,
                    child: animateFactor >= 0.3
                        ? AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            switchInCurve: Curves.easeIn,
                            child: haveFocus
                                ? Opacity(
                                    opacity: animateFactor,
                                    child: Container(
                                      height: 120 * animateFactor,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5 * animateFactor,
                                          vertical: 10 * animateFactor),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRect(
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                    sigmaX: 5 * animateFactor,
                                                    sigmaY: 5 * animateFactor,
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          20 * animateFactor,
                                                      vertical:
                                                          6 * animateFactor,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(10 *
                                                              animateFactor),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 1 *
                                                              animateFactor),
                                                    ),
                                                    child: Text(
                                                      travel.country,
                                                      style: TextStyle(
                                                          fontSize: 16 *
                                                              animateFactor,
                                                          letterSpacing:
                                                              1 * animateFactor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5 * animateFactor),
                                            ClipRect(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Container(
                                                  margin: EdgeInsets.zero,
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX:
                                                          10 * animateFactor,
                                                      sigmaY:
                                                          10 * animateFactor,
                                                    ),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            20 * animateFactor,
                                                        vertical:
                                                            3 * animateFactor,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(20 *
                                                                  animateFactor),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 1)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors
                                                                .yellow[900],
                                                            size: 20 *
                                                                animateFactor,
                                                          ),
                                                          SizedBox(
                                                              width: 5 *
                                                                  animateFactor),
                                                          Text(
                                                            '${travel.starts}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18 *
                                                                    animateFactor),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  )
                                : Container(),
                          )
                        : const SizedBox()),
                AnimatedPositioned(
                    duration: duration,
                    curve: Curves.easeInOut,
                    bottom: 0 - 100 * (1 - value) * animateFactor,
                    left: 0,
                    right: 0,
                    child: animateFactor >= 0.3
                        ? Opacity(
                            opacity: animateFactor,
                            child: ClipRect(
                              child: Container(
                                margin: EdgeInsets.zero,
                                width: size.width * animateFactor,
                                height: size.height * .10 * animateFactor,
                                child: Stack(children: [
                                  BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 5 * animateFactor,
                                      sigmaY: 5 * animateFactor,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10 * animateFactor,
                                          vertical: 5 * animateFactor),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              travel.city,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing:
                                                      2 * animateFactor,
                                                  fontSize: 16 * animateFactor,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Container(
                                              margin: EdgeInsets.zero,
                                              width: size.width *
                                                  .8 *
                                                  animateFactor,
                                              height: size.height *
                                                  .06 *
                                                  animateFactor,
                                              child: Text(
                                                travel.description,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing:
                                                        1 * animateFactor,
                                                    fontSize:
                                                        12 * animateFactor,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          )
                        : const SizedBox())
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ShaderCard extends StatelessWidget {
  const _ShaderCard();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.black38,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
