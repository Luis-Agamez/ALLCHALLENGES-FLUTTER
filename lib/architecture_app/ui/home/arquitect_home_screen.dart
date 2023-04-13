import 'package:flutter/material.dart';

import '../general/general_screen.dart';

class ArquitectHomeScreen extends StatelessWidget {
  const ArquitectHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/arquitectImg/construction_1.jpg',
            fit: BoxFit.cover,
          )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                      0,
                      .1,
                      .5
                    ],
                        colors: [
                      Colors.transparent,
                      const Color.fromARGB(255, 1, 13, 34).withOpacity(.2),
                      const Color.fromARGB(255, 1, 13, 34).withOpacity(.8)
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Left Find a Home That perfect for you ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PBold',
                          fontSize: 28,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w900),
                    ),
                    const Text(
                      'Search confidential whith you trusted sources at home for sale and rent   ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PRegular',
                          fontSize: 16,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w400),
                    ),
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
                                  child: const GeneralScreen());
                            },
                          ),
                        );
                      },
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(seconds: 1),
                        curve: Curves.decelerate,
                        tween: Tween(begin: 0, end: 1),
                        builder: (context, double value, child) {
                          return Container(
                            width: 160 * value,
                            height: 60,
                            padding: EdgeInsets.symmetric(
                                vertical: 10 * value, horizontal: 30 * value),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25 * value),
                              color: Colors.white,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Next'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'PBold',
                                        fontSize: 18 * value,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 2 * value),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 24 * value,
                                  )
                                ]),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
