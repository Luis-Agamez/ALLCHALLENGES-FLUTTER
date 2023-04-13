import 'dart:math';

import 'package:app_one/coffee_app/global/styles.dart';
import 'package:app_one/coffee_app/ui/alternative/painter/screen_painter.dart';
import 'package:flutter/material.dart';

import '../../domain/models/coffee.dart';
import '../details/details_screen.dart';

class AlternativeScreen extends StatefulWidget {
  const AlternativeScreen({super.key, required this.frozen});
  final Coffee frozen;

  @override
  State<AlternativeScreen> createState() => _AlternativeScreenState();
}

class _AlternativeScreenState extends State<AlternativeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backgroundAnimation1;
  late Animation<double> _backgroundAnimation2;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _backgroundAnimation1 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.5, curve: Curves.easeInOut));
    _backgroundAnimation2 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 0.8, curve: Curves.easeInOut));
    _animationController.forward();
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
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Positioned.fill(
                child: CustomPaint(
              painter: ScreenPainter(),
            )),
            Positioned(
              top: 120,
              left: -100,
              child: Transform.rotate(
                angle: -pi / 2,
                child: Container(
                  width: 280,
                  height: 60,
                  child: Text(
                    widget.frozen.name,
                    style: TextStyle(
                        fontSize: 42,
                        color: primaryColor,
                        letterSpacing: 1,
                        fontFamily: 'GRegular'),
                  ),
                ),
              ),
            ),
            Positioned(
                top: size.height / 1.8,
                left: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.frozen.name,
                          style: TextStyle(
                              color: primaryColor,
                              letterSpacing: 1,
                              fontSize: 32,
                              fontFamily: 'PBold'),
                        ),
                        Text(
                          widget.frozen.description,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontFamily: 'PMedium'),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const ButtonCount(
                                    sign: '-', color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                      fontFamily: 'PMedium'),
                                ),
                                const SizedBox(width: 5),
                                const ButtonCount(
                                  sign: '+',
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Text(
                              '\$18',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 38,
                                  fontFamily: 'PMedium'),
                            ),
                          ],
                        )
                      ],
                    ))),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                  right: -30,
                  top: 90,
                  child: Hero(
                    tag: widget.frozen.name,
                    child: Transform.translate(
                      offset:
                          Offset(800 * (1 - _backgroundAnimation1.value), 0),
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.zero,
                            width: 400,
                            height: 400,
                            child: Image.asset(widget.frozen.imgUrls[0])),
                      ),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: _backgroundAnimation2.value,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: primaryColor,
                                )),
                              ),
                            ),
                            Container(
                              width: size.width * .8,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: primaryColor,
                              ),
                              child: const Center(
                                child: Text(
                                  'Order Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    fontSize: 24,
                                    fontFamily: 'PBold',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              },
            ),
            Positioned(
                top: 20,
                right: 20,
                child: Text(
                  'Special ',
                  style: TextStyle(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = backgroundColorLight,
                      letterSpacing: 1,
                      fontSize: 50,
                      fontFamily: 'CRegular'),
                )),
          ],
        ));
  }
}
