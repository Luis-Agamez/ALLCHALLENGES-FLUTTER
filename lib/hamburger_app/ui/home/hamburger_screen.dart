import 'package:app_one/hamburger_app/domain/entities/hamburger.dart';
import 'package:app_one/hamburger_app/domain/entities/product.dart';
import 'package:app_one/hamburger_app/ui/home/widgets/carrousel_products.dart';
import 'package:flutter/material.dart';

import '../../domain/data/data.dart';
import 'widgets/card_order_product.dart';

class BurgerHomeScreen extends StatefulWidget {
  const BurgerHomeScreen({super.key});

  @override
  State<BurgerHomeScreen> createState() => _BurgerHomeScreenState();
}

class _BurgerHomeScreenState extends State<BurgerHomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerIn;
  late AnimationController _animationControllerArrows;

  late Animation<double> _animationArrow1;
  late Animation<double> _animationArrow2;
  late Animation<double> _animationArrow3;

  bool isOut = false;
  bool isDrag = false;
  bool isOrderContent = false;

  @override
  void initState() {
    _animationControllerIn = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    _animationControllerArrows = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _animationArrow1 = CurvedAnimation(
        parent: _animationControllerArrows,
        curve: const Interval(0.0, 0.4, curve: Curves.linear));
    _animationArrow2 = CurvedAnimation(
        parent: _animationControllerArrows,
        curve: const Interval(0.4, 0.7, curve: Curves.linear));
    _animationArrow3 = CurvedAnimation(
        parent: _animationControllerArrows,
        curve: const Interval(0.7, 1.0, curve: Curves.linear));

    _animationControllerIn.forward();
    _animationControllerArrows.forward();

    _animationControllerArrows.addListener(() {
      if (_animationControllerArrows.isCompleted) {
        _animationControllerArrows.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationControllerArrows.removeListener(() {});
    _animationControllerArrows.dispose();
    _animationControllerIn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: AnimatedBuilder(
          animation: _animationControllerIn,
          builder: (context, child) {
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: isOut ? 1 : 0),
              duration: const Duration(milliseconds: 600),
              curve: Curves.decelerate,
              builder: (context, double value, child) {
                return Container(
                  margin: EdgeInsets.zero,
                  width: size.width,
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(
                            0,
                            isOut
                                ? -200 * value
                                : -200 * (1 - _animationControllerIn.value)),
                        child: Container(
                          height: size.height * 0.1,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert_sharp)),
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/bankImg/photo.jpg'),
                              )
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            isOut
                                ? -300 * value
                                : -300 * (1 - _animationControllerIn.value),
                            0),
                        child: Container(
                          margin: EdgeInsets.zero,
                          width: size.width * .75,
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'Order Your Favorite Food',
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'QBold',
                              fontSize: 36,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Transform.translate(
                        offset: Offset(
                            isOut
                                ? 700 * value
                                : 700 * (1 - _animationControllerIn.value),
                            0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: size.width * .1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  width: size.width * .22,
                                  height: size.height * .1,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 239, 239, 240),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(items[index].name,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: items[index].color,
                                              fontFamily: 'ORegular'))
                                    ],
                                  ));
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Transform.translate(
                        offset: Offset(
                            0,
                            isOut
                                ? (size.height * .7) * value
                                : (size.height * .7) *
                                    (1 - _animationControllerIn.value)),
                        child: Container(
                          width: size.width,
                          child: SingleChildScrollView(
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isOut = true;
                                  });
                                },
                                child: CorrouselProducts(products: products)),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        bottomSheet: AnimatedBuilder(
          animation: _animationControllerIn,
          builder: (context, child) {
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: isOut ? 1 : 0),
              duration: const Duration(milliseconds: 800),
              curve: Curves.decelerate,
              builder: (context, double value, child) {
                return GestureDetector(
                  onHorizontalDragDown: (details) {
                    print(details.localPosition.dy);
                    if (details.localPosition.dy < 90 && !isDrag) {
                      setState(() {
                        isDrag = true;
                      });

                      Future.delayed(const Duration(milliseconds: 900), () {
                        setState(() {
                          isOrderContent = true;
                        });
                      });
                    } else if (details.localPosition.dy < 35 && isDrag) {
                      setState(() {
                        isDrag = false;
                        isOrderContent = false;
                      });

                      /* Future.delayed(const Duration(milliseconds: 900), () {
                        setState(() {
                          isOrderContent = false;
                        });
                      }); */
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    color: Colors.transparent,
                    height: isDrag ? size.height * .9 : 100,
                    child: Transform.translate(
                      offset: Offset(
                          0,
                          isOut
                              ? (size.height * .7) * value
                              : (size.height * .7) *
                                  (1 - _animationControllerIn.value)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: ClipPath(
                            clipper: _CurveTopClipper(),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              color: const Color.fromARGB(255, 10, 10, 10),
                              child: isOrderContent
                                  ? Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 30),
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'My Orders',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'QBold',
                                                fontSize: 36,
                                                letterSpacing: 2,
                                              ),
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: order.length,
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              itemBuilder: (context, index) {
                                                return CardOrderProduct(
                                                    index: index + 1,
                                                    product: order[index]);
                                              },
                                            ),
                                            Container(
                                              width: size.width,
                                              height: 60,
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0XFF1F1F23),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text('Apply Cupon Code',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: 'OBold',
                                                          fontSize: 14,
                                                          letterSpacing: 1)),
                                                  Container(
                                                    width: size.width * .3,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0XFFFFF2DF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: const Center(
                                                      child: Text('Apply',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'OBold',
                                                              fontSize: 18,
                                                              letterSpacing:
                                                                  1)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 40),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text('Subtotal',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  'OBold',
                                                              fontSize: 15,
                                                              letterSpacing:
                                                                  1)),
                                                      Text('88.97 USS',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  'OBold',
                                                              fontSize: 15,
                                                              letterSpacing: 1))
                                                    ]),
                                                const SizedBox(height: 10),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text('Shiping Free',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  'OBold',
                                                              fontSize: 15,
                                                              letterSpacing:
                                                                  1)),
                                                      Text('Standard - Free',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  'OBold',
                                                              fontSize: 15,
                                                              letterSpacing: 1))
                                                    ]),
                                                const SizedBox(height: 10),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text('Estimated Total',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'OBold',
                                                              fontSize: 18,
                                                              letterSpacing:
                                                                  1)),
                                                      Text('22.97 USS + Tax',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'OBold',
                                                              fontSize: 18,
                                                              letterSpacing: 1))
                                                    ])
                                              ],
                                            ),
                                            const SizedBox(height: 60),
                                            Container(
                                              width: size.width,
                                              height: 60,
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0XFF1F1F23),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  AnimatedBuilder(
                                                    animation:
                                                        _animationControllerArrows,
                                                    builder: (context, child) {
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width:
                                                                size.width * .3,
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0XFFFFF2DF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50)),
                                                            child: const Center(
                                                              child: Icon(
                                                                Icons
                                                                    .shopping_bag_outlined,
                                                                size: 32,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                          Opacity(
                                                            opacity: .5 +
                                                                (.5 *
                                                                    _animationArrow1
                                                                        .value),
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_forward_ios_outlined,
                                                              color:
                                                                  Colors.white,
                                                              size: 18,
                                                            ),
                                                          ),
                                                          Opacity(
                                                            opacity: .5 +
                                                                (.5 *
                                                                    _animationArrow2
                                                                        .value),
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_forward_ios_outlined,
                                                              color:
                                                                  Colors.grey,
                                                              size: 18,
                                                            ),
                                                          ),
                                                          Opacity(
                                                            opacity: .5 +
                                                                (.5 *
                                                                    _animationArrow3
                                                                        .value),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_ios_outlined,
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3),
                                                              size: 18,
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  const Text('Apply Cupon Code',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: 'OBold',
                                                          fontSize: 14,
                                                          letterSpacing: 1)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: isDrag
                                          ? []
                                          : [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 25,
                                                    child: Text('2',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily: 'OBold',
                                                            fontSize: 15,
                                                            letterSpacing: 1)),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text('Cart',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'OBold',
                                                              fontSize: 18,
                                                              letterSpacing:
                                                                  1)),
                                                      Text('2 items',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'OBold',
                                                              fontSize: 14,
                                                              letterSpacing: 1))
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: size.width * .4,
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Stack(
                                                  children: [
                                                    Positioned.fill(
                                                        left: 0,
                                                        child: CircleProduct(
                                                            product:
                                                                hamburgers[1])),
                                                    Positioned.fill(
                                                        left: 40,
                                                        child: CircleProduct(
                                                            product: hamburgers[
                                                                12])),
                                                  ],
                                                ),
                                              )
                                            ],
                                    ),
                            ),
                          )),
                          Positioned(
                              top: 0,
                              left: size.width * .4,
                              right: size.width * .4,
                              child: Center(
                                child: Container(
                                  width: size.width * 2,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}

class _CurveTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path()
      ..moveTo(0, 30)
      ..cubicTo(width * 0, 25, width * .005, 10, width * .065, 1)
      ..lineTo(width * .08, 0)
      ..lineTo(width * .35, 0)
      ..lineTo(width * .4, 15)
      ..lineTo(width * .6, 15)
      ..lineTo(width * .65, 0)
      ..lineTo(width * .9, 0)
      ..cubicTo(width * .94, 0, width * .99, 10, width, 30)
      ..lineTo(width, height)
      ..lineTo(0, height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class CircleProduct extends StatelessWidget {
  final Hamburger product;
  const CircleProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0XFFFFF2DF),
      radius: 25,
      child: Center(
          child: Container(
        margin: EdgeInsets.zero,
        width: 25,
        height: 25,
        child: Image.asset(
          product.img,
          fit: BoxFit.contain,
        ),
      )),
    );
  }
}
