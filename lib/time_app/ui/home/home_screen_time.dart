import 'package:flutter/material.dart';
import '../details/details_screen.dart';
import '../painters/tongue_painter.dart';
import 'widgets/widgets.dart';

class HomeScreenTime extends StatefulWidget {
  const HomeScreenTime({
    super.key,
  });

  @override
  State<HomeScreenTime> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenTime>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backgroundAnimation1;
  late Animation<double> _backgroundAnimation2;
  late Animation<double> _backgroundAnimation3;
  late Animation<double> _backgroundAnimation4;
  late ValueNotifier<bool> _hideAppBarNotifier;
  bool isOnTap = true;
  bool expandAppointment = false;
  bool showAppointmentDetails = false;

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

    _hideAppBarNotifier = ValueNotifier(false);

    _animationController.addListener(() {
      if (_animationController.isAnimating) {
        setState(() {
          isOnTap = false;
        });
      } else {
        setState(() {
          isOnTap = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(() {});
    super.dispose();
  }

  void _onTapExpandButton(Duration animationDuration) {
    if (expandAppointment) {
      _animationController.reverse();
      setState(() {
        showAppointmentDetails = !showAppointmentDetails;
      });

      setState(() {
        expandAppointment = showAppointmentDetails;
      });
    } else {
      _animationController.forward();

      setState(() {
        expandAppointment = !expandAppointment;
      });
      Future.delayed(animationDuration, () {
        setState(() {
          showAppointmentDetails = expandAppointment;
        });
      });
    }
  }

  void _openSpecsPage(BuildContext context, Widget avatar) async {
    _hideAppBarNotifier.value = true;
    await Navigator.push(
        context,
        PageRouteBuilder(
          reverseTransitionDuration: const Duration(milliseconds: 600),
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: DetailsScreen(avatar: avatar),
            );
          },
        ));
    _hideAppBarNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const expandDuration = Duration(milliseconds: 1000);
    final heightCurtain = (size.width * .75).clamp(450.0, 510.0);
    final width = size.width;
    final height = size.height;
    return Scaffold(
        body: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Background(width: width, height: height),
                  Positioned(
                      bottom: 60,
                      right: 0,
                      left: 0,
                      child: Opacity(
                        opacity: 1 - _backgroundAnimation2.value,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 320,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const _HeaderBottom(),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    ItemGeneral(
                                      isColorBackground: false,
                                      isColorText: false,
                                      isColorTemperature: true,
                                      clime: 'Rain',
                                      temperature: '20º',
                                      date: '11 Feb',
                                      urlImage: 'assets/img/sun1.png',
                                    ),
                                    ItemGeneral(
                                      isColorBackground: true,
                                      isColorText: false,
                                      isColorTemperature: true,
                                      clime: 'Sun',
                                      temperature: '20º',
                                      date: '12 Feb',
                                      urlImage: 'assets/img/sun1.png',
                                    ),
                                    ItemGeneral(
                                      isColorBackground: false,
                                      isColorText: false,
                                      isColorTemperature: true,
                                      clime: 'Rain',
                                      temperature: '12º',
                                      date: '13 Feb',
                                      urlImage: 'assets/img/rain.png',
                                    ),
                                    ItemGeneral(
                                      isColorBackground: false,
                                      isColorText: false,
                                      isColorTemperature: true,
                                      clime: 'Rain',
                                      temperature: '15º',
                                      date: '14 Feb',
                                      urlImage: 'assets/img/rain.png',
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      )),
                  AnimatedPositioned(
                      duration: expandDuration,
                      curve: Curves.fastOutSlowIn,
                      top: 0,
                      width: width,
                      height: expandAppointment
                          ? 280 +
                              (heightCurtain *
                                  _backgroundAnimation1.value.clamp(0.2, 1.0))
                          : heightCurtain,
                      child: CustomPaint(
                        painter: TonguePainter(curveRadius: 30),
                        child: ClipRect(
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 0,
                            ),
                            child: Column(
                              children: [
                                const _AppBar(),
                                GestureDetector(
                                    onTap: () => _openSpecsPage(
                                          context,
                                          const Avatar(),
                                        ),
                                    child: const CardClime()),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.25),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: const Offset(9,
                                              4), // changes position of shadow
                                        ),
                                      ]),
                                  child: showAppointmentDetails
                                      ? CardDetailsClime(
                                          backgroundAnimation3:
                                              _backgroundAnimation3)
                                      : const SizedBox(),
                                ),
                                const Spacer(),
                                Center(
                                  child: IconButton(
                                    onPressed: () => isOnTap
                                        ? _onTapExpandButton(expandDuration)
                                        : () {},
                                    icon: Icon(
                                      showAppointmentDetails
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      size: 30,
                                      color: Colors.white70,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    width: 240,
                    height: 120,
                    right: width / 5,
                    bottom: -200 * (1 - _backgroundAnimation3.value),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.only(top: 10),
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
                          _BottomCardData(
                              imgUrl: 'assets/img/pressure.png',
                              label: 'Pressure',
                              data: '1012 ºhPa'),
                          _BottomCardData(
                              imgUrl: 'assets/img/ocean.png',
                              label: 'Hight',
                              data: '1012 m'),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}

class _BottomCardData extends StatelessWidget {
  const _BottomCardData({
    super.key,
    required this.imgUrl,
    required this.label,
    required this.data,
  });

  final String imgUrl;
  final String label;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Container(
                width: 40,
                height: 40,
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.contain,
                ))),
        Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w900,
                  fontSize: 14),
            ),
            Text(
              data,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      height: 120,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            maxRadius: 25,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.menu_sharp,
              color: Colors.black,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 62, 5, 218),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Rome',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                child: const Center(
                  child: Text(
                    'Uptading',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ],
          ),
          const Hero(tag: '10000', child: Avatar())
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 2,
              blurRadius: 0,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: const CircleAvatar(
          maxRadius: 25,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(''
              'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1676088039~exp=1676088639~hmac=f0c9a5502631ba638086c4043c037635be909c19040a24a515b045914913c23a')),
    );
  }
}

class _HeaderBottom extends StatelessWidget {
  const _HeaderBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Today forecast',
          style: TextStyle(
              fontSize: 24, letterSpacing: 1, fontWeight: FontWeight.w700),
        ),
        Row(children: [
          const Text(
            'Next Weekly',
            style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
                size: 18,
              ))
        ])
      ],
    );
  }
}
