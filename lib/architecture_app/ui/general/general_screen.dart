import 'dart:math';

import 'package:app_one/architecture_app/ui/general/painter/painter.dart';
import 'package:flutter/material.dart';

import '../details/details_screen.dart';
import 'painter/painter_tow.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backgroundAnimation1;
  late Animation<double> _backgroundAnimation2;
  late Animation<double> _backgroundAnimation3;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _backgroundAnimation1 = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.2));
    _backgroundAnimation2 = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.3, 0.7));
    _backgroundAnimation3 = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.7, 1.0));

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                  child: Image.asset('assets/arquitectImg/home_1_2.jpg')),
              Positioned(
                  left: 0,
                  right: 0,
                  height: size.height * .3,
                  child: CustomPaint(
                    painter: Painter(),
                    child: Stack(
                      children: [
                        Positioned(
                            top: size.height * .05,
                            left: 0,
                            right: 0,
                            child: Container(
                                width: size.height * .2,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              color: Colors.black,
                                              width: 2,
                                              style: BorderStyle.solid),
                                        ),
                                        child: Center(
                                            child: Transform.rotate(
                                                angle: pi *
                                                    _backgroundAnimation2.value,
                                                child: const Icon(
                                                  Icons.arrow_right_alt_rounded,
                                                  size: 30,
                                                ))),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 120,
                                          child: const Text(
                                            'Millennial Homes',
                                            textAlign: TextAlign.right,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontFamily: 'PBold',
                                                color: Colors.black,
                                                fontSize: 20,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Icon(Icons.add_home_sharp,
                                                color: Colors.grey, size: 20),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Millennial Homes',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'PRegular',
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )))
                      ],
                    ),
                  )),
              Positioned(
                  top: size.height * .5,
                  left: 0,
                  right: 0,
                  height: size.height * .5,
                  child: CustomPaint(
                    painter: PainterTwo(),
                    child: Stack(children: [
                      Positioned(
                          top: size.height * .07,
                          left: size.width * .15,
                          child: Transform.translate(
                            offset: Offset(
                                -100 * (1 - _backgroundAnimation1.value), 0),
                            child: const _CircleItem(
                                icon: Icon(
                              Icons.bed_outlined,
                              size: 20,
                              color: Colors.black,
                            )),
                          )),
                      Positioned(
                          top: size.height * .12,
                          left: size.width * .35,
                          child: Transform.translate(
                            offset: Offset(
                                0, 900 * (1 - _backgroundAnimation2.value)),
                            child: const _CircleItem(
                                icon: Icon(
                              Icons.bathtub_rounded,
                              size: 20,
                              color: Colors.black,
                            )),
                          )),
                      Positioned(
                          top: size.height * .16,
                          left: size.width * .55 * _backgroundAnimation3.value,
                          child: Transform.translate(
                            offset: Offset(
                                700 * (1 - _backgroundAnimation3.value), 0),
                            child: const _CircleItem(
                                icon: Icon(
                              Icons.local_parking_outlined,
                              size: 20,
                              color: Colors.black,
                            )),
                          )),
                      Positioned(
                        top: size.height * .3,
                        bottom: 0,
                        left: 10,
                        child: Transform.translate(
                          offset: Offset(
                              0, 200 * (1 - _backgroundAnimation3.value)),
                          child: Container(
                            width: 80,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 30),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(25)),
                              color: Color(0xffdfe7e4),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(milliseconds: 600),
                                        pageBuilder: (_, animation, __) {
                                          return FadeTransition(
                                              opacity: animation,
                                              child: const DetailsScreen());
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 2, 118, 120),
                                          width: 2,
                                        )),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '\$75',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'PBold',
                                          fontSize: 24,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('/ month',
                                        style: TextStyle(
                                            fontFamily: 'PRegular',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * .3,
                        left: size.width * .5,
                        right: 30,
                        bottom: size.height * .06,
                        child: Container(
                          child: const Text(
                            'is a vast country in South America stretching  Iguazu Falls in the south. Symbolized by its 38m statue.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 30,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'PRegular',
                                fontSize: 12,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ]),
                  ))
            ],
          );
        },
      ),
    );
  }
}

class _CircleItem extends StatelessWidget {
  const _CircleItem({
    super.key,
    required this.icon,
  });
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color.fromARGB(255, 2, 118, 120),
            width: 2,
          )),
      child: icon,
    );
  }
}
