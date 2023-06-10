import 'dart:math';

import 'package:app_one/air/ui/details/air_details_screen.dart';
import 'package:app_one/air/ui/home/widgets/citys_carrousel.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';

import '../../../travel_app/domain/data/data.dart';
import '../../domain/data/data.dart';
import '../../domain/entities/card_travel.dart';

class AirHomeScreen extends StatefulWidget {
  const AirHomeScreen({super.key});

  @override
  State<AirHomeScreen> createState() => _AirHomeScreenState();
}

class _AirHomeScreenState extends State<AirHomeScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late FixedExtentScrollController _fixedController;
  int i = 0;
  int prevewPage = 0;
  double _page = 0;
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  bool _animation = true;
  bool isVisible = true;
  bool isAnimation1 = true;
  bool isAnimation2 = true;
  bool isAnimation3 = true;
  bool isAcelerated = false;

  void onScroll() {
    setState(() {
      _page = _pageController.page!;
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 30000));

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

    _pageController = PageController(
      viewportFraction: .95,
    );
    _pageController.addListener(onScroll);

    _animationController.addListener(() {
      if (_animationController.isCompleted) {}
    });

    _animation1.addListener(() {
      if (_animation1.isCompleted) {
        isAnimation1 = false;
      }
    });
    _animation2.addListener(() {});
    _animation3.addListener(() {});

    _fixedController = FixedExtentScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController.removeListener(() {});
    _animation1.removeListener(() {});
    _animation2.removeListener(() {});
    _animation3.removeListener(() {});
    _fixedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _openSpecsPage(BuildContext context, CardTravel travel) async {
      await Navigator.push(
          context,
          PageRouteBuilder(
            reverseTransitionDuration: const Duration(milliseconds: 1000),
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                  opacity: animation,
                  child: AirDetailsScreen(
                    isDetails: true,
                    data: travel,
                  ));
            },
          ));

      setState(() {
        isAcelerated = false;
      });
    }

    const Color _primaryColor = Color(0xFF253F47);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/airImg/backg.png',
            fit: BoxFit.cover,
          )),
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * .45,
            child: Center(
                child: Container(
                    margin: EdgeInsets.zero,
                    width: size.width,
                    height: size.height * .5,
                    child: Image.asset(
                      'assets/airImg/clouds.png',
                      fit: BoxFit.cover,
                    ))),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(.5),
                    Colors.transparent,
                  ])),
            ),
          ),
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 1600),
            tween: Tween(begin: 0, end: _animation ? 1 : 0),
            onEnd: () {
              setState(() {
                _animation = !_animation;
              });
            },
            builder: (context, double value, child) {
              return AnimatedPositioned(
                curve: Curves.decelerate,
                duration: Duration(milliseconds: isAcelerated ? 300 : 800),
                top: isAcelerated
                    ? size.height * .2
                    : size.height * .1 + (size.height * .15 * (1 - value)),
                left: isAcelerated ? size.width : size.width * .01,
                child: Center(
                    child: Container(
                        margin: EdgeInsets.zero,
                        width: size.width * .8,
                        height: size.height * .2,
                        child: Image.asset('assets/airImg/animation.png'))),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return AnimatedPositioned(
                  top: size.height * .15,
                  left: 700 * (1 - _animation1.value),
                  duration: const Duration(milliseconds: 2000),
                  child: Transform.translate(
                    offset: Offset(isAnimation1 ? -300 : -300, 0),
                    child: Center(
                        child: Container(
                            margin: EdgeInsets.zero,
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/airImg/clouds_fast_2.png'))),
                  ));
            },
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return AnimatedPositioned(
                  top: size.height * .15,
                  left: 700 * (1 - _animation2.value),
                  duration: const Duration(milliseconds: 2000),
                  child: Transform.translate(
                    offset: Offset(isAnimation1 ? -300 : -300, 0),
                    child: Center(
                        child: Container(
                            margin: EdgeInsets.zero,
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/airImg/clouds_fast_3.png'))),
                  ));
            },
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return AnimatedPositioned(
                  top: size.height * .15,
                  left: 700 * (1 - _animation3.value),
                  duration: const Duration(milliseconds: 2000),
                  child: Transform.translate(
                    offset: Offset(isAnimation1 ? -300 : -300, 0),
                    child: Center(
                        child: Container(
                            margin: EdgeInsets.zero,
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/airImg/clouds_fast_4.png'))),
                  ));
            },
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: size.height * .17,
              child: SizedBox(
                  width: size.width,
                  height: size.height * .5,
                  child: ClickableListWheelScrollView(
                    itemCount: 5,
                    itemHeight: 200,
                    scrollController: _fixedController,
                    onItemTapCallback: (index) {
                      setState(() {
                        isAcelerated = true;
                      });

                      Future.delayed(
                        const Duration(milliseconds: 800),
                        () {
                          _openSpecsPage(context, cardTravels[index]);
                        },
                      );
                    },
                    child: ListWheelScrollView.useDelegate(
                      controller: _fixedController,
                      diameterRatio: 1.6,
                      perspective: 0.006,
                      physics: const FixedExtentScrollPhysics(),
                      itemExtent: 200,
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 5,
                        builder: (context, index) {
                          return CardTravelHome(travel: cardTravels[index]);
                        },
                      ),
                    ),
                  )
                  /*Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                        right: 20,
                        left: 20,
                        top: 40,
                        bottom: 160,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return AnimatedBuilder(
                              animation: _animation1,
                              builder: (context, child) {
                                return Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.0001)
                                    ..rotateX(0),
                                  child: Container(
                                    margin: EdgeInsets.zero,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      clipBehavior: Clip.none,
                                      children: [
                                        ...List.generate(
                                            2,
                                            (index) => Card3DItem(
                                                  _animation1,
                                                  isMode: true,
                                                  indexSelected: 1,
                                                  verticalFactor: 0,
                                                  card: GestureDetector(
                                                    onTap: () {
                                                      print('card click');
                                                      setState(() {
                                                        isAcelerated = true;
                                                      });

                                                      Future.delayed(
                                                        const Duration(
                                                            milliseconds: 800),
                                                        () {
                                                          _openSpecsPage(
                                                              context);
                                                        },
                                                      );
                                                    },
                                                    child: const CardTravel(),
                                                  ),
                                                  percent: _animationController
                                                      .value,
                                                  depth: index,
                                                  height:
                                                      constraints.maxHeight /
                                                          1.5,
                                                )).reversed.toList()
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )),
                  ],
                ),*/
                  )),
          Positioned(
              bottom: -30,
              left: 0,
              right: 0,
              child: CitysCarrousel(travels: travels..reversed))
        ],
      ),
    );
  }
}

class Card3DItem extends AnimatedWidget {
  const Card3DItem(
    this.animation, {
    super.key,
    required this.card,
    required this.percent,
    required this.height,
    required this.depth,
    required this.indexSelected,
    required this.isMode,
    required this.verticalFactor,
  }) : super(listenable: animation);
  final Widget card;
  final double percent;
  final int indexSelected;
  final double height;
  final bool isMode;
  final int verticalFactor;
  final Animation<double> animation;

  final int depth;

  Animation<double> get animate => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    double depthFactor = 45.0;
    final bottomMargin = height / 6;
    final double top =
        height + (-depth / 1.5) * height * percent - bottomMargin;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      left: 0,
      right: 0,
      top: isMode && indexSelected == depth ? top + -40 : top,
      child: Opacity(
        opacity: 1,
        child: Transform(
            alignment: Alignment.center,
            key: key,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(
                  0.0,
                  verticalFactor * 1 * MediaQuery.of(context).size.height,
                  depth * depthFactor),
            child: card),
      ),
    );
  }
}

class CardTravelHome extends StatefulWidget {
  const CardTravelHome({super.key, required this.travel});
  final CardTravel travel;

  @override
  State<CardTravelHome> createState() => _CardTravelState();
}

class _CardTravelState extends State<CardTravelHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const Color _primaryColor = Color(0xFF06e4bf);
    return Container(
      padding: const EdgeInsets.all(20),
      width: size.width * .9,
      height: size.height * .22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF101E24),
          gradient: const LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.center,
              colors: [
                Color.fromARGB(255, 4, 167, 139),
                Color(0xFF253F47),
              ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.travel.originInitials,
                        style: const TextStyle(
                            fontFamily: 'PMedium',
                            fontSize: 24,
                            color: Colors.white,
                            letterSpacing: 1)),
                    Text(widget.travel.originName,
                        style: const TextStyle(
                            fontFamily: 'PRegular',
                            fontSize: 12,
                            color: Colors.white,
                            letterSpacing: 1))
                  ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.airplanemode_on_outlined,
                    color: _primaryColor,
                    size: 18,
                  ),
                  const Text('--------------------',
                      style: TextStyle(
                        fontFamily: 'PRegular',
                        fontSize: 10,
                        color: _primaryColor,
                      )),
                  Text(widget.travel.hours,
                      style: const TextStyle(
                        fontFamily: 'PRegular',
                        fontSize: 14,
                        letterSpacing: 1,
                        color: _primaryColor,
                      ))
                ],
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.travel.destinyInitials,
                        style: const TextStyle(
                            fontFamily: 'PMedium',
                            fontSize: 24,
                            color: Colors.white,
                            letterSpacing: 1)),
                    Text(widget.travel.originDestiny,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('DATE & TIME',
                        style: TextStyle(
                            fontFamily: 'PMedium',
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 1)),
                    Text(widget.travel.date,
                        style: const TextStyle(
                            fontFamily: 'PRegular',
                            fontSize: 12,
                            color: Colors.white,
                            letterSpacing: 1))
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('FLIGHT NUMBER',
                        style: TextStyle(
                            fontFamily: 'PMedium',
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 1)),
                    Text(widget.travel.number,
                        style: const TextStyle(
                            fontFamily: 'PRegular',
                            fontSize: 12,
                            color: Colors.white,
                            letterSpacing: 1))
                  ]),
            ],
          )
        ],
      ),
    );
  }
}
