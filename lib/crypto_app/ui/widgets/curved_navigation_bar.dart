import 'dart:math';

import 'package:flutter/material.dart';

import '../compare_crypto_screen.dart';

class CurvedNavigationBar extends StatelessWidget {
  const CurvedNavigationBar({
    super.key,
    required this.items,
    this.onTap,
    this.unselectedColor = Colors.grey,
    this.selectedColor = Colors.white,
    this.currentIndex = 0,
  }) : assert(
          items.length == 4,
          'The correct functioning of this widgets '
          'depends on its items being exactly 4',
        );

  final List<CurvedNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final Color unselectedColor;
  final Color selectedColor;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Color(0xFF26262A),
      ),
      height: 100,
      child: Stack(
        children: [
          Positioned.fill(
              child: ClipPath(
                  clipper: _CurvedClipper2(),
                  child: Container(
                    height: size.height,
                    width: size.width,
                    color: const Color(0xFF1b60e6),
                  ))),
          Positioned(
              left: size.width * .355,
              top: 1,
              child: Container(
                width: size.width * .25,
                height: size.width * .25,
                decoration: BoxDecoration(
                  color: const Color(0xFF1b60e6),
                  borderRadius: BorderRadius.circular(size.width * .125),
                ),
              )),
          Positioned(
            left: size.width * .38,
            top: 10,
            child: Container(
              width: size.width * .2,
              height: size.width * .2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * .1),
                color: const Color(0xFF26262A),
              ),
            ),
          ),
          Positioned.fill(
            top: 40,
            child: Container(
              color: const Color(0xFF26262A),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              //----------------------------------
              // Generate Navigation Items
              //----------------------------------
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(items.length, (index) {
                        final item = items[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: (index == 0 || index == 3) ? 10.0 : 10.0,
                          ),
                          child: IconButton(
                            onPressed: () => onTap?.call(index),
                            color: index == currentIndex
                                ? selectedColor
                                : unselectedColor,
                            icon: Icon(
                              index == currentIndex
                                  ? item.selectedIconData ?? item.iconData
                                  : item.iconData,
                              size: 32,
                            ),
                          ),
                        );
                      })
                        ..insert(2, const SizedBox()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: size.width * .405,
              top: 20,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 600),
                      pageBuilder: (_, animation, __) {
                        return FadeTransition(
                            opacity: animation,
                            child: const CompareCryptoScreen());
                      },
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF1b60e6),
                      gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          stops: [
                            .5,
                            .5
                          ],
                          colors: [
                            Color.fromARGB(204, 27, 95, 230),
                            Color(0xFF1b60e6),
                          ])),
                  child: Center(
                    child: Transform.rotate(
                        angle: pi / 2,
                        child: const Icon(
                          Icons.compare_arrows_outlined,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class CurvedNavigationBarItem {
  const CurvedNavigationBarItem({
    required this.iconData,
    this.selectedIconData,
  });

  final IconData iconData;
  final IconData? selectedIconData;
}

class _CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    // double chartHeight = 240;
    // final height = chartHeight;
    final path = Path();
    final segmentWidth = width / 3 / 2;
    final segment = (size.width / 6);
    return Path()

      // ..lineTo(0, size.height);
      // ..quadraticBezierTo(size.width * .5, kToolbarHeight, size.width, 0)
      // ..lineTo(size.width, size.height)
      ..moveTo(0, size.height / 3)
      ..lineTo(segment * 1.8, size.height / 4)
      ..cubicTo(
        segment * 2.6,
        size.height / 4,
        segment * 2.4,
        5,
        segment * 3.1,
        8,
      )
      ..cubicTo(
        segment * 3.3,
        8,
        segment * 3.5,
        size.height / 4,
        segment * 3.9,
        size.height / 4,
      )
      ..lineTo(size.width, size.height / 4)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    /*    moveTo(0, height)
      ..cubicTo(segmentWidth, height, 2 * segmentWidth, 0, 3 * segmentWidth, 0)
      ..cubicTo(4 * segmentWidth, 0, 5 * segmentWidth, height, 6 * segmentWidth,
          height); */
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _CurvedClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, size.height * .4)
      ..lineTo(size.width * .5, size.height * .3)
      ..lineTo(size.width, size.height * .4)
      ..lineTo(size.width * .5, size.height * .6);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
