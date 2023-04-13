import 'dart:math';
import 'package:flutter/material.dart';
import '../graphics/graphic_screen.dart';
import '../home/widgets/background.dart';
import 'widgets/item_clime.dart';
import 'widgets/item_relative_data.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.avatar}) : super(key: key);
  final Widget avatar;
  static const _angleRotateBoat = (2 * pi);
  static const _dxTranslate = 20.0;
  static const _dyTranslate = 0.0;

  //-------------------------------------------------
  // Custom Flight Hero
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
            ..translate(_dxTranslate * value, _dyTranslate * value, 0)
            ..rotateZ(_angleRotateBoat * value)
            ..scale(1 + .5 * value),
          child: child,
        );
      },
      child: avatar,
    );
  }

  @override
  Widget build(BuildContext context) {
    final animateItemNotifier = ValueNotifier(false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateItemNotifier.value = true;
    });
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(PageRouteBuilder(
                transitionsBuilder: ((context, animation, _, child) {
                  return FadeTransition(opacity: animation, child: child);
                }),
                pageBuilder: ((
                  context,
                  _,
                  __,
                ) =>
                    const GraphicScreen())));
          },
          child: const Icon(Icons.auto_graph_outlined, size: 32),
        ),
        body: Stack(children: [
          Background(width: width, height: height),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 60),
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: '10000',
                          flightShuttleBuilder:
                              (_, animation, flightDirection, __, ___) {
                            return _flightShuttleBuilder(
                                animation, flightDirection);
                          },
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate(_dxTranslate, _dyTranslate, 0)
                              ..rotateZ(_angleRotateBoat)
                              ..scale(1 + .5),
                            child: avatar,
                          ),
                        ),
                        Column(
                          children: const [
                            Text(
                              'Rin showers ',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Monday,12 Feb',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              const HeaderClimeData(
                  imgUrl: 'assets/img/sun1.png',
                  temperature: '21º',
                  feelsLike: 'Feels like 26'),
              Center(
                child: Container(
                  width: 380,
                  height: 160,
                  margin: const EdgeInsets.only(right: 5, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.center,
                          stops: [
                            0.2,
                            0.8
                          ],
                          colors: [
                            Colors.purple,
                            Color.fromARGB(255, 62, 5, 218),
                          ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ItemRelativeData(
                          imgUrl: 'assets/img/wind.png',
                          label: 'Wind',
                          data: '10 m/s'),
                      ItemRelativeData(
                          imgUrl: 'assets/img/humidity.png',
                          label: 'Humidity',
                          data: '98%'),
                      ItemRelativeData(
                          imgUrl: 'assets/img/pa.png',
                          label: 'Rain',
                          data: '100%'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 10, left: 20, right: 10, top: 10),
                height: 260,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: const Text(
                            'Today',
                            style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1,
                                color: Colors.purple,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            ItemClime(
                              time: '3 pm',
                              temperature: '24º',
                              urlImg: 'assets/img/sun1.png',
                              isColorBackground: true,
                            ),
                            ItemClime(
                              time: '6 pm',
                              temperature: '22º',
                              urlImg: 'assets/img/clounds.png',
                              isColorBackground: false,
                            ),
                            ItemClime(
                              time: '9 pm',
                              temperature: '18º',
                              urlImg: 'assets/img/rain.png',
                              isColorBackground: false,
                            ),
                            ItemClime(
                              time: '12 pm',
                              temperature: '20º',
                              urlImg: 'assets/img/sun.png',
                              isColorBackground: false,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              Spacer(),
            ],
          )
        ]));
  }
}

class HeaderClimeData extends StatelessWidget {
  const HeaderClimeData({
    super.key,
    required this.imgUrl,
    required this.temperature,
    required this.feelsLike,
  });

  final String imgUrl;
  final String temperature;
  final String feelsLike;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 62, 5, 218).withOpacity(0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  temperature,
                  style: const TextStyle(
                      fontSize: 82,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(feelsLike,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          Center(
            child: Container(
                width: 180,
                height: 180,
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.contain,
                )),
          )
        ],
      ),
    );
  }
}
