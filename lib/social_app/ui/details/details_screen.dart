import 'package:flutter/material.dart';

import '../../../travel_app/domain/data/data.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../home/paints/paint_border.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const backgroundColor = Color(0xFF1C1C1E);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Ana de Armas',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PRegular',
                          fontSize: 14),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HomeScreenSocialApp.primaryColor),
                      child: const Center(
                          child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  ],
                ),
                const Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.white,
                  size: 36,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                          color: HomeScreenSocialApp.primaryColor, width: 3)),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/5e/4a/e3/5e4ae3f967dedb0fa2b825151ca139ce.jpg'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ana'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'PBold',
                          fontSize: 18),
                    ),
                    const Text(
                      'Musican',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PRegular',
                          fontSize: 18),
                    ),
                    const Text(
                      '"Nicole" - the album - OUT NOW',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PRegular',
                          fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '319'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'PBold',
                              fontSize: 24),
                        ),
                        const Text(
                          'Post',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'PRegualr',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: size.width * .22,
                              height: size.height * .05,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: HomeScreenSocialApp
                                                  .primaryColor,
                                              width: 3)),
                                      child: const CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            'https://i.pinimg.com/564x/e4/3a/0a/e43a0a2ee314fa66499a3ce10490abaa.jpg'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 10,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: HomeScreenSocialApp
                                                  .primaryColor,
                                              width: 3)),
                                      child: const CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            'https://i.pinimg.com/564x/d1/b0/20/d1b020920db659d93955a0c057a18afe.jpg'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 20,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: HomeScreenSocialApp
                                                  .primaryColor,
                                              width: 3)),
                                      child: const CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            'https://i.pinimg.com/564x/85/49/9d/85499d16fb900ae36b1cf5f85146bbbd.jpg'),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 0,
                                    right: -20,
                                    child: Text(
                                      '2.1M',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'PBold',
                                          fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Followers',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'PRegualr',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: size.width * .25,
                              height: size.height * .05,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: HomeScreenSocialApp
                                                  .primaryColor,
                                              width: 3)),
                                      child: const CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            'https://i.pinimg.com/564x/85/49/9d/85499d16fb900ae36b1cf5f85146bbbd.jpg'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 10,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: HomeScreenSocialApp
                                                  .primaryColor,
                                              width: 3)),
                                      child: const CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            'https://i.pinimg.com/564x/8c/24/7f/8c247fbf0059d5877645138543a0cc71.jpg'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 20,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: HomeScreenSocialApp
                                                  .primaryColor,
                                              width: 3)),
                                      child: const CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            'https://i.pinimg.com/564x/d1/b0/20/d1b020920db659d93955a0c057a18afe.jpg'),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Text(
                                      '576',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'PBold',
                                          fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Following',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'PRegualr',
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 600),
                        pageBuilder: (_, animation, __) {
                          return FadeTransition(
                              opacity: animation, child: const ChatScreen());
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: size.width * .4,
                    height: size.height * .06,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text(
                        'Message',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PMedium',
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * .4,
                  height: size.height * .06,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      'Following',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PMedium',
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipPath(
              clipper: _CurveTopClipper(),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                color: Colors.white,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: travels[0].images.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          margin: EdgeInsets.zero,
                          width: size.width * .5,
                          height: size.height * .6,
                          child: Image.asset(
                            travels[0].images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaintBord extends CustomPainter {
  PaintBord({required this.curveRadius});
  final double curveRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromCenter(
          center: Offset(0, size.height * .6),
          width: size.width,
          height: size.height,
        ),
      );

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(0, -40, size.width * 0.05, -55, size.width * 0.12, -60)
      ..lineTo(size.width * 0.12, -60)
      ..quadraticBezierTo(size.width * .5, -80, size.width * 0.86, -60)
      ..cubicTo(size.width * 0.93, -55, size.width * 0.98, -60, size.width, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);
    canvas..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _CurveTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 100)
      ..cubicTo(0, 40, size.width * 0.05, 45, size.width * 0.12, 40)
      ..lineTo(size.width * 0.12, 40)
      ..quadraticBezierTo(size.width * .5, 20, size.width * 0.86, 40)
      ..cubicTo(size.width * 0.93, 45, size.width * 0.98, 40, size.width, 100)
      ..lineTo(size.width, 100)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
