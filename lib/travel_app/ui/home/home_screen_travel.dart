import 'dart:ui';

import 'package:app_one/travel_app/ui/home/widgets/search_app_bat.dart';
import 'package:flutter/material.dart';

import '../../domain/data/data.dart';
import 'widgets/travel_card.dart';
import 'widgets/travel_popular_card.dart';

class HomeScreenTravel extends StatefulWidget {
  const HomeScreenTravel({Key? key}) : super(key: key);

  @override
  State<HomeScreenTravel> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenTravel>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backgroundAnimation;
  late PageController? _pageController;
  late PageController? _pageController_2;
  int? _travelIndex;
  int? _travelIndex_2;
  double? _page;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _backgroundAnimation = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.linear));

    _animationController.forward();

    _pageController = PageController(viewportFraction: .7, initialPage: 1);
    _travelIndex = 1;
    _pageController_2 = PageController();
    _travelIndex_2 = 0;
    _page = 1.0;

    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      _page = _pageController!.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xFF0A1317),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final backgroundValue = _backgroundAnimation.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                const Positioned(
                    left: 0, right: 0, top: 10, child: SearchAppBar()),
                Positioned(
                    left: 1,
                    right: 0,
                    top: size.height * .12,
                    child: Container(
                      margin: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Discover',
                            style: TextStyle(
                                color: Color.fromARGB(255, 243, 108, 11),
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600,
                                fontSize: 36),
                          ),
                          Text(
                            'Choose your favorite place',
                            style: TextStyle(
                                color: Color.fromARGB(255, 110, 110, 110),
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )
                        ],
                      ),
                    )),
                Positioned(
                    top: size.height * .25,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * .3,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController_2,
                        onPageChanged: (value) {
                          setState(() {
                            _travelIndex_2 = value;
                          });
                        },
                        itemCount: populars.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: TravelPopularCard(
                              size: size,
                              travel: populars[index],
                              haveFocus: index == _travelIndex_2,
                            ),
                          );
                        },
                      ),
                    )),
                Positioned(
                    top: size.height * .5,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height * .45,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: _pageController,
                            onPageChanged: (value) {
                              setState(() {
                                _travelIndex = value;
                              });
                            },
                            itemCount: travels.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: TravelCard(
                                    animateFactor: backgroundValue,
                                    haveFocus: index == _travelIndex,
                                    travel: travels[index],
                                    factorChange: (_page! - index).abs(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
