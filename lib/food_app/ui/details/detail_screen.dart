import 'dart:math';

import 'package:app_one/food_app/ui/cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/pizza.dart';

class DetailsScreen extends StatefulWidget {
  final Pizza pizza;
  static const _angleRotate = 1 * pi;
  static const _dxTranslate = 0.0;
  static const _dyTranslate = 0.0;

  const DetailsScreen({super.key, required this.pizza});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerOpacity;
  late AnimationController _animationCenter;
  late AnimationController _animationControllerBackground;
  late Animation<double> _opacityAnimation;
  bool scale = false;
  bool isConstraint = false;
  int count = 1;

  @override
  void initState() {
    _animationControllerOpacity = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _animationCenter = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    _opacityAnimation = CurvedAnimation(
        parent: _animationControllerOpacity,
        curve: const Interval(0.5, 1.0, curve: Curves.bounceOut));

    _animationControllerBackground = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _animationControllerOpacity.forward();

    _animationCenter.addListener(() {
      if (_animationCenter.isAnimating) {
        _animationControllerBackground.forward();
      }
      if (_animationCenter.isCompleted) {
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            setState(() {
              scale = true;
              isConstraint = true;
            });
          },
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationCenter.removeListener(() {});
    super.dispose();
  }

  //-------------------------------------------------
  Widget _flightShuttleBuilder(
      Animation animation, HeroFlightDirection flightDirection) {
    final isPop = flightDirection == HeroFlightDirection.pop;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final value = isPop
            ? Curves.easeInBack.transform(animation.value)
            : Curves.easeOutBack.transform(animation.value);
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(DetailsScreen._dxTranslate * value,
                DetailsScreen._dyTranslate * value, 0)
            ..rotateZ(DetailsScreen._angleRotate * value)
            ..scale(1 + .5 * value),
          child: child,
        );
      },
      child: _Image(url: widget.pizza.image),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('isContait ${isConstraint}');
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFF),
      body: Stack(
        children: [
          Positioned(
              top: size.height * .07,
              left: 10,
              right: 10,
              child: const HeaderAppBar()),
          Positioned(
              top: size.height * .15,
              left: 10,
              right: 0,
              child: AnimatedBuilder(
                animation: _animationControllerOpacity,
                builder: (context, child) {
                  return Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset:
                                Offset(0, -100 * (1 - _opacityAnimation.value)),
                            child: Opacity(
                              opacity: .4 + (_opacityAnimation.value * .6),
                              child: Text(
                                widget.pizza.name,
                                style: const TextStyle(
                                    fontFamily: 'PMedium',
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontSize: 32),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset:
                                Offset(0, -120 * (1 - _opacityAnimation.value)),
                            child: Opacity(
                              opacity: .4 + (_opacityAnimation.value * .6),
                              child: Text(
                                'with ${widget.pizza.pricipal}',
                                style: const TextStyle(
                                    fontFamily: 'PMedium',
                                    letterSpacing: 1,
                                    color: Colors.grey,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset:
                                Offset(-200 * (1 - _opacityAnimation.value), 0),
                            child: Opacity(
                              opacity: _opacityAnimation.value,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.star_outlined,
                                      color: Colors.yellow[800]),
                                  Icon(Icons.star_outlined,
                                      color: Colors.yellow[800]),
                                  Icon(Icons.star_outlined,
                                      color: Colors.yellow[800]),
                                  Icon(Icons.star_outlined,
                                      color: Colors.yellow[800]),
                                  Icon(Icons.star_outlined,
                                      color: Colors.yellow[800]),
                                  Text(
                                    '(${widget.pizza.stars})',
                                    style: const TextStyle(
                                        fontFamily: 'PBold',
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Transform.translate(
                            offset:
                                Offset(0, 300 * (1 - _opacityAnimation.value)),
                            child: Opacity(
                              opacity: .2 + _opacityAnimation.value * .8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\$',
                                        style: TextStyle(
                                            fontFamily: 'PBold',
                                            fontSize: 14,
                                            color: Colors.yellow[800]),
                                      ),
                                      Text(
                                        '${widget.pizza.price}',
                                        style: const TextStyle(
                                            fontFamily: 'PBold',
                                            letterSpacing: 1,
                                            color: Colors.black,
                                            fontSize: 32),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('Calories',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontFamily: 'PRegular')),
                                  Text('${widget.pizza.calories}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontFamily: 'PBold')),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('Diameter / Portions',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontFamily: 'PRegular')),
                                  Text('${10}`/ ${widget.pizza.slices} Slices',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontFamily: 'PBold')),
                                  const SizedBox(height: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Sizes',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontFamily: 'PBold')),
                                      const SizedBox(height: 10),
                                      Container(
                                        margin: EdgeInsets.zero,
                                        width: size.width,
                                        height: size.width * .1,
                                        child: Row(
                                          children: [
                                            ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount:
                                                  widget.pizza.sizes.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                    width: size.width * .22,
                                                    height: size.height * .1,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0XFFFFDF99),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            widget.pizza
                                                                .sizes[index],
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .black,
                                                                    fontFamily:
                                                                        'PBold'))
                                                      ],
                                                    ));
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Tooping',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontFamily: 'PBold')),
                                      const SizedBox(height: 10),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          margin: EdgeInsets.zero,
                                          height: size.width * .1,
                                          child: Row(
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemCount: widget
                                                    .pizza.ingredients.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                      width: size.width * .22,
                                                      height: size.height * .1,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0XFFFFDF99),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              widget.pizza
                                                                      .ingredients[
                                                                  index],
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'PBold'))
                                                        ],
                                                      ));
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Divider(color: Colors.grey[400]),
                                  Text(widget.pizza.description,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[600],
                                          fontFamily: 'PMedium')),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              )),
          Positioned(
              child: AnimatedBuilder(
            animation: _animationControllerBackground,
            builder: (context, child) {
              return Opacity(
                opacity: _animationControllerBackground.value,
                child: Container(
                  width: size.width,
                  height: size.height,
                  color: Colors.white,
                ),
              );
            },
          )),
          Positioned(
              top: size.height * .22,
              right: -size.width * .24,
              child: AnimatedBuilder(
                animation: _animationCenter,
                builder: (context, child) {
                  return Hero(
                    tag: widget.pizza.name,
                    flightShuttleBuilder: (flightContext, animation,
                        flightDirection, fromHeroContext, toHeroContext) {
                      return _flightShuttleBuilder(animation, flightDirection);
                    },
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: scale ? 1 : 0),
                      duration: const Duration(milliseconds: 500),
                      builder: (_, double value, __) {
                        return Transform.translate(
                          offset: Offset(value * -160, 400 * value),
                          child: Transform.scale(
                            scale: 1 - (value * .9),
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..translate(
                                    ((-size.width) + 240) *
                                        _animationCenter.value,
                                    ((size.height / 2) - 240) *
                                        _animationCenter.value)
                                ..scale(1 - (.5 * _animationCenter.value))
                                ..rotateZ((2 * pi) * _animationCenter.value),
                              child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..translate(DetailsScreen._dxTranslate,
                                        DetailsScreen._dyTranslate, 0)
                                    ..rotateZ(DetailsScreen._angleRotate)
                                    ..scale(1 + .5),
                                  child: _Image(url: widget.pizza.image)),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              )),
          Positioned(
              left: 20,
              right: 20,
              bottom: size.height * .1,
              child: AnimatedBuilder(
                animation: _animationControllerOpacity,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        0,
                        (size.height * .6) *
                            (1 - _animationControllerOpacity.value)),
                    child: Container(
                      width: size.width,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          Positioned(
                              left: 10,
                              top: 5,
                              bottom: 5,
                              right: size.width * .5,
                              child: AnimatedBuilder(
                                animation: _animationCenter,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(
                                        (size.width * .20) *
                                            _animationCenter.value,
                                        0),
                                    child: Opacity(
                                      opacity: isConstraint ? 0 : 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAFCFE),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 24,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  count--;
                                                });
                                              },
                                            ),
                                            Text(count.toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey[800],
                                                    fontFamily: 'PMedium')),
                                            IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  count++;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                          AnimatedPositioned(
                              duration: const Duration(milliseconds: 600),
                              right: isConstraint ? 60 : 5,
                              bottom: 5,
                              top: 5,
                              left: isConstraint
                                  ? size.width * .55
                                  : size.width * .42,
                              child: AnimatedBuilder(
                                animation: _animationCenter,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(
                                        -(size.width * .20) *
                                            _animationCenter.value,
                                        0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _animationCenter.forward();

                                        Future.delayed(
                                          const Duration(milliseconds: 1500),
                                          () {
                                            Navigator.pushReplacement(context,
                                                PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                  secondaryAnimation) {
                                                return FadeTransition(
                                                    opacity: animation,
                                                    child: CartScreen(
                                                        pizza: widget.pizza));
                                              },
                                            ));
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0XFF121A2B)),
                                        child: Row(
                                          mainAxisAlignment: isConstraint
                                              ? MainAxisAlignment.center
                                              : MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.shopping_bag_rounded,
                                              size: 32,
                                              color: Color(0XFFFBBC26),
                                            ),
                                            Container(
                                                child: TweenAnimationBuilder<
                                                    double>(
                                              tween: Tween(
                                                  begin: 1,
                                                  end: isConstraint ? 0 : 1),
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              builder: (context, double value,
                                                  child) {
                                                return Opacity(
                                                  opacity: value,
                                                  child: Text('Add to Cart',
                                                      style: TextStyle(
                                                          fontSize: 18 * value,
                                                          color: const Color(
                                                              0XFFFBBC26),
                                                          fontFamily:
                                                              'PRegular')),
                                                );
                                              },
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 240,
        height: 240,
        margin: EdgeInsets.zero,
        child: Image.asset(
          url,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_outlined,
                  size: 32, color: Colors.black)),
          Icon(Icons.favorite_outlined, size: 32, color: Colors.red[900]),
        ],
      ),
    );
  }
}
