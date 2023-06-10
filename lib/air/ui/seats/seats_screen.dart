import 'package:flutter/material.dart';

import '../../domain/data/data.dart';
import '../animations/widgets/translate_animation.dart';
import 'widgets/seats_row.dart';

class SeatsScreen extends StatelessWidget {
  const SeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final seatsSelectedNotifier = ValueNotifier(0);

    return Scaffold(
      backgroundColor: const Color(0XFF23293C),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              bottom: 0,
              left: 40,
              right: 40,
              top: size.height * .1,
              child: ClipPath(
                clipper: _CurveTopClipper2(),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0XFF466D79),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 2)
                      ]),
                ),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: size.width * .8,
              child: ClipPath(
                clipper: _CurveTopClipper3(),
                child: Container(
                  height: 250,
                  color: const Color(0XFF466D79),
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: size.width * .8,
              child: ClipPath(
                clipper: _CurveTopClipper4(),
                child: Container(
                  height: 250,
                  color: const Color(0XFF466D79),
                ),
              )),
          Positioned(
              bottom: 0,
              left: 40,
              right: 40,
              top: size.height * .2,
              child: ClipPath(
                clipper: _CurveTopClipper1(),
                child: Container(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 120),
                  decoration: const BoxDecoration(
                      color: Color(0XFF2D334C),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 2)
                      ]),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TranslateAnimation(
                                  duration: const Duration(milliseconds: 700),
                                  child: Column(
                                    children: List.generate(
                                        SeatsRowData.seatsList.length, (i) {
                                      return RowSeats(
                                        seatsSelectedNotifier:
                                            seatsSelectedNotifier,
                                        numSeats:
                                            SeatsRowData.seatsList[i].seats,
                                        seatsOccupied: SeatsRowData
                                            .seatsList[i].occupiedSeats,
                                      );
                                    }),
                                  ),
                                ),
                                TranslateAnimation(
                                  duration: const Duration(milliseconds: 700),
                                  child: Column(
                                    children: List.generate(
                                        SeatsRowData.seatsList.length, (i) {
                                      return RowSeats(
                                        seatsSelectedNotifier:
                                            seatsSelectedNotifier,
                                        numSeats:
                                            SeatsRowData.seatsList[i].seats,
                                        seatsOccupied: SeatsRowData
                                            .seatsList[i].occupiedSeats,
                                      );
                                    }),
                                  ),
                                ),
                                TranslateAnimation(
                                  duration: const Duration(milliseconds: 700),
                                  child: Column(
                                    children: List.generate(
                                        SeatsRowData.seatsList.length, (i) {
                                      return RowSeats(
                                        seatsSelectedNotifier:
                                            seatsSelectedNotifier,
                                        numSeats:
                                            SeatsRowData.seatsList[i].seats,
                                        seatsOccupied: SeatsRowData
                                            .seatsList[i].occupiedSeats,
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TranslateAnimation(
                                  duration: const Duration(milliseconds: 700),
                                  child: Column(
                                    children: List.generate(
                                        SeatsRowData.seatsList.length, (i) {
                                      return RowSeats(
                                        seatsSelectedNotifier:
                                            seatsSelectedNotifier,
                                        numSeats:
                                            SeatsRowData.seatsList[i].seats,
                                        seatsOccupied: SeatsRowData
                                            .seatsList[i].occupiedSeats,
                                      );
                                    }),
                                  ),
                                ),
                                TranslateAnimation(
                                  duration: const Duration(milliseconds: 700),
                                  child: Column(
                                    children: List.generate(
                                        SeatsRowData.seatsList.length, (i) {
                                      return RowSeats(
                                        seatsSelectedNotifier:
                                            seatsSelectedNotifier,
                                        numSeats:
                                            SeatsRowData.seatsList[i].seats,
                                        seatsOccupied: SeatsRowData
                                            .seatsList[i].occupiedSeats,
                                      );
                                    }),
                                  ),
                                ),
                                TranslateAnimation(
                                  duration: const Duration(milliseconds: 700),
                                  child: Column(
                                    children: List.generate(
                                        SeatsRowData.seatsList.length, (i) {
                                      return RowSeats(
                                        seatsSelectedNotifier:
                                            seatsSelectedNotifier,
                                        numSeats:
                                            SeatsRowData.seatsList[i].seats,
                                        seatsOccupied: SeatsRowData
                                            .seatsList[i].occupiedSeats,
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _CurveTopClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 200)
      ..quadraticBezierTo(size.width * .5, -150, size.width, 200)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _CurveTopClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 200)
      ..quadraticBezierTo(size.width * .5, -200, size.width, 200)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _CurveTopClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, size.height * .5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _CurveTopClipper4 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height * .5)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
