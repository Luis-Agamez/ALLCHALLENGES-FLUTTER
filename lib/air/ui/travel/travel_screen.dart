import 'dart:math';

import 'package:app_one/air/ui/seats/seats_screen.dart';
import 'package:flutter/material.dart';

import '../../../travel_app/domain/models/travel_model.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key, required this.city});
  final Travel city;

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _animation1 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.3, curve: Curves.linear));
    _animation2 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 0.6, curve: Curves.decelerate));
    _animation3 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1, curve: Curves.decelerate));

    _animationController.forward();
    super.initState();
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
      backgroundColor: const Color(0xFF253F47),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(
                widget.city.images.first,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
              )),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black,
                        Colors.transparent,
                      ])),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                right: 20,
                child: Transform.translate(
                    offset: Offset(0,
                        -size.height * .3 * (1 - _animationController.value)),
                    child: const CityAppBar()),
              ),
              Positioned(
                top: size.height * .1,
                left: 20,
                right: size.width * .3,
                child: Transform.translate(
                  offset:
                      Offset(0, size.height * .1 * _animationController.value),
                  child: Container(
                    margin: EdgeInsets.zero,
                    child: Text('Luis, Welcome to ${widget.city.city} ',
                        maxLines: 10,
                        style: const TextStyle(
                          fontFamily: 'CRegular',
                          fontSize: 45,
                          letterSpacing: 1,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Positioned(
                  bottom: size.height * .3,
                  left: 20,
                  right: 20,
                  child: CardTravelItem(city: widget.city)),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black])),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class CardTravelItem extends StatelessWidget {
  const CardTravelItem({super.key, required this.city});
  final Travel city;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF253F47).withOpacity(.9)),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(.8)),
                  child: const Center(
                    child: Text('Arrives',
                        style: TextStyle(
                          fontFamily: 'CRegular',
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ),
                ),
                const Text('1 Stop in CPH',
                    style: TextStyle(
                      fontFamily: 'CRegular',
                      fontSize: 16,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Bogota',
                    style: TextStyle(
                      fontFamily: 'PMedium',
                      fontSize: 16,
                      color: Colors.white,
                    )),
                Text(city.city,
                    style: const TextStyle(
                      fontFamily: 'PMedium',
                      fontSize: 16,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Next,Mayo 7 11:20 pm',
                    style: TextStyle(
                        fontFamily: 'PRegular',
                        fontSize: 12,
                        color: Colors.white,
                        letterSpacing: 1)),
                Text('9:40',
                    style: TextStyle(
                        fontFamily: 'PRegular',
                        fontSize: 12,
                        color: Colors.white,
                        letterSpacing: 1))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('BOGOTA'.replaceRange(3, null, '').toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'PBold',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('------',
                        style: TextStyle(
                          fontFamily: 'PRegular',
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                    Transform.rotate(
                        angle: pi * .5,
                        child: const Icon(Icons.local_airport_outlined,
                            size: 45, color: Colors.white)),
                    const Text('------',
                        style: TextStyle(
                          fontFamily: 'PRegular',
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                  ],
                ),
                Text(city.city.replaceRange(3, null, '').toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'PBold',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                      opacity: animation, child: const SeatsScreen());
                },
              ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              width: size.width,
              height: size.height * .05,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('PICKUP MY BAG',
                      style: TextStyle(
                          fontFamily: 'PBold',
                          fontSize: 14,
                          color: Colors.white,
                          letterSpacing: 1)),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 25, color: Colors.white)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CityAppBar extends StatelessWidget {
  const CityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const Color _primaryColor = Color.fromARGB(255, 4, 167, 139);
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF253F47).withOpacity(.6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: _primaryColor,
                  ),
                  child: const Center(
                      child: Icon(Icons.location_pin,
                          size: 25, color: Color(0xFF253F47))),
                ),
                const Text('100 0000 points',
                    style: TextStyle(
                        fontFamily: 'PMedium',
                        fontSize: 18,
                        color: Colors.white,
                        letterSpacing: 1))
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('LMA',
                  style: TextStyle(
                    fontFamily: 'CRegular',
                    fontSize: 18,
                    color: Colors.white,
                  )),
              SizedBox(height: 5),
              Text('industries',
                  style: TextStyle(
                    fontFamily: 'PRegular',
                    fontSize: 12,
                    letterSpacing: 1,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
