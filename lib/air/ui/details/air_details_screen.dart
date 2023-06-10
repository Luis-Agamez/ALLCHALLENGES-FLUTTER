import 'dart:math';

import 'package:flutter/material.dart';

import '../../domain/entities/card_travel.dart';
import '../home/air_home_screen.dart';
import '../seats/seats_screen.dart';

class AirDetailsScreen extends StatefulWidget {
  const AirDetailsScreen({
    super.key,
    required this.isDetails,
    required this.data,
  });
  final bool isDetails;
  final CardTravel data;

  @override
  State<AirDetailsScreen> createState() => _AirDetailsScreenState();
}

class _AirDetailsScreenState extends State<AirDetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationControllerOpacity;
  late Animation<double> _animation1;
  late AnimationController _animationController3;
  bool _animation = true;
  bool _opacity = false;
  bool _airplaneOpacity = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animationControllerOpacity = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animationController3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 8000));

    _animation1 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1, curve: Curves.bounceOut));

    _animationController.forward();

    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationControllerOpacity.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController.removeListener(() {});
    _animationControllerOpacity.dispose();
    _animationController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const Color _primaryColor = Color(0xFF06e4bf);
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              color: Color(0xFF101E24),
              gradient: RadialGradient(
                  radius: 1.5,
                  center: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 4, 167, 139),
                    Color(0xFF253F47),
                  ])),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: widget.isDetails
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        width: 2,
                                        color: const Color.fromARGB(
                                            255, 4, 167, 139))),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back_outlined,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const Text('Boarding pass',
                                style: TextStyle(
                                    fontFamily: 'PMedium',
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 1)),
                            const Icon(
                              Icons.add_alert_rounded,
                              size: 25,
                              color: Colors.white,
                            )
                          ],
                        )
                      : const SizedBox()),
              Positioned(
                  left: 20,
                  right: 20,
                  bottom:
                      widget.isDetails ? size.height * .3 : size.height * .4,
                  child: ClipPath(
                    clipper: _CircleClipper(),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 40, left: 20, right: 20, bottom: 0),
                      height: size.height * .5,
                      decoration: const BoxDecoration(
                          /* border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  strokeAlign: 1,
                                  color: _primaryColor,
                                  style: BorderStyle.solid)
                                  ),*/
                          color: Color(0XFF1B363F),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.rotate(
                                    angle: pi * .5,
                                    child: const Icon(
                                      Icons.airplanemode_active_sharp,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(widget.data.number,
                                      style: const TextStyle(
                                          fontFamily: 'PBold',
                                          fontSize: 12,
                                          color: Colors.white,
                                          letterSpacing: 1))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(widget.data.originInitials,
                                            style: const TextStyle(
                                                fontFamily: 'PMedium',
                                                fontSize: 26,
                                                color: Colors.white,
                                                letterSpacing: 1)),
                                        Text(widget.data.originName,
                                            style: const TextStyle(
                                                fontFamily: 'PRegular',
                                                fontSize: 16,
                                                color: Colors.white,
                                                letterSpacing: 1))
                                      ]),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(widget.data.destinyInitials,
                                            style: const TextStyle(
                                                fontFamily: 'PMedium',
                                                fontSize: 36,
                                                color: Colors.white,
                                                letterSpacing: 1)),
                                        Text(widget.data.originDestiny,
                                            style: const TextStyle(
                                                fontFamily: 'PRegular',
                                                fontSize: 16,
                                                color: Colors.white,
                                                letterSpacing: 1))
                                      ]),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(widget.data.hours,
                                        style: const TextStyle(
                                            fontFamily: 'PMedium',
                                            fontSize: 16,
                                            color: Colors.white,
                                            letterSpacing: 1)),
                                    Text(widget.data.date,
                                        style: const TextStyle(
                                            fontFamily: 'PRegular',
                                            fontSize: 12,
                                            color: Colors.white,
                                            letterSpacing: 1))
                                  ]),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text('SEAT',
                                        style: TextStyle(
                                            fontFamily: 'PMedium',
                                            fontSize: 16,
                                            color: Colors.white,
                                            letterSpacing: 1)),
                                    Text(widget.data.number,
                                        style: const TextStyle(
                                            fontFamily: 'PRegular',
                                            fontSize: 12,
                                            color: Colors.white,
                                            letterSpacing: 1))
                                  ]),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text('TICKET PRICE',
                                        style: TextStyle(
                                            fontFamily: 'PMedium',
                                            fontSize: 16,
                                            color: Colors.white,
                                            letterSpacing: 1)),
                                    Text('\$${widget.data.price}',
                                        style: const TextStyle(
                                            fontFamily: 'PRegular',
                                            fontSize: 12,
                                            color: Colors.white,
                                            letterSpacing: 1))
                                  ]),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text('CLASS',
                                        style: TextStyle(
                                            fontFamily: 'PMedium',
                                            fontSize: 16,
                                            color: Colors.white,
                                            letterSpacing: 1)),
                                    Text('Business',
                                        style: TextStyle(
                                            fontFamily: 'PRegular',
                                            fontSize: 12,
                                            color: Colors.white,
                                            letterSpacing: 1))
                                  ]),
                            ],
                          ),
                          const Text('---------------------------',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'PRegular',
                                fontSize: 20,
                                color: _primaryColor,
                              )),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  left: 20,
                  right: 20,
                  bottom: widget.isDetails
                      ? size.height * .08
                      : size.height * .1798,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 150 * (1 - _animation1.value)),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 0),
                          height: size.height * .22,
                          decoration: const BoxDecoration(
                            color: Color(0XFF1B363F),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('---------------------------',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: 'PRegular',
                                    fontSize: 20,
                                    color: _primaryColor,
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Boarding pass',
                                      style: TextStyle(
                                          fontFamily: 'PMedium',
                                          fontSize: 20,
                                          color: Colors.white,
                                          letterSpacing: 1)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 30),
                                    width: 300,
                                    height: 60,
                                    child: Image.asset(
                                      'assets/airImg/code.png',
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              Positioned(
                  left: 20,
                  right: 20,
                  bottom: size.height * .01,
                  child: widget.isDetails
                      ? const SizedBox()
                      : AnimatedBuilder(
                          animation: _animationControllerOpacity,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                  0,
                                  400 *
                                      (1 - _animationControllerOpacity.value)),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _opacity = true;
                                      });
                                      Future.delayed(
                                        const Duration(milliseconds: 2500),
                                        () {
                                          Navigator.pushReplacement(context,
                                              PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: const AirHomeScreen(),
                                              );
                                            },
                                          ));
                                        },
                                      );
                                    },
                                    child: Opacity(
                                      opacity: .5 +
                                          .5 *
                                              _animationControllerOpacity.value,
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0XFF1B363F)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Text('CONFIRM',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                    fontFamily: 'Pbold')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(context,
                                          PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: const SeatsScreen(),
                                          );
                                        },
                                      ));
                                    },
                                    child: Opacity(
                                      opacity: .5 +
                                          .5 *
                                              _animationControllerOpacity.value,
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                255, 107, 3, 3)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Text('CANCEL',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                    fontFamily: 'Pbold')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
              Positioned.fill(
                  top: _opacity ? 0 : size.height,
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 300),
                    tween: Tween(begin: 0, end: _opacity ? 1 : 0),
                    onEnd: () {
                      setState(() {
                        _airplaneOpacity = true;
                      });
                      _animationController3.forward();
                    },
                    builder: (context, double value, child) {
                      return Opacity(
                        opacity: value,
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            'assets/airImg/backg.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  )),
              AnimatedBuilder(
                animation: _animationController3,
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
                        child: Opacity(
                          opacity: _airplaneOpacity ? 1 : 0,
                          child: Center(
                              child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..scale(
                                0.1 + 8 * _animationController3.value,
                              )
                              ..rotateZ(pi * .24 * value),
                            child: Container(
                                margin: EdgeInsets.zero,
                                width: size.width * .8,
                                height: size.height * .2,
                                child: Image.asset('assets/airImg/front.png')),
                          )),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          )),
    );
  }
}

class _CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path()
      ..moveTo(0, 30)
      ..cubicTo(width * 0, 25, width * .005, 10, width * .065, 1)
      ..lineTo(width * .08, 0)
      ..lineTo(width * .35, 0)
      ..lineTo(width * .4, 15)
      ..lineTo(width * .6, 15)
      ..lineTo(width * .65, 0)
      ..lineTo(width * .9, 0)
      ..cubicTo(width * .94, 0, width * .99, 10, width, 30)
      ..lineTo(width, height * .9)
      ..arcToPoint(Offset(width, height),
          clockwise: false, radius: const Radius.circular(1))
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..arcToPoint(Offset(0, height * .9),
          clockwise: false, radius: const Radius.circular(1));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
