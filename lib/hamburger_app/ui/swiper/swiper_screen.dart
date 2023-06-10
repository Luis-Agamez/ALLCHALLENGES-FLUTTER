import 'dart:math';

import 'package:app_one/hamburger_app/ui/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/hamburger.dart';

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({super.key, required this.products});
  final List<Hamburger> products;

  @override
  State<SwiperScreen> createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _arrowAnimation;
  bool _animated = false;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    _animation = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 1.0, curve: Curves.decelerate));

    _arrowAnimation = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.decelerate));

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void _openSpecsPage(BuildContext context, Hamburger hamburger) async {
      await Navigator.push(
          context,
          PageRouteBuilder(
            reverseTransitionDuration: const Duration(milliseconds: 1500),
            transitionDuration: const Duration(milliseconds: 1500),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                  opacity: animation,
                  child: DetailsScreen(hamburguer: hamburger));
            },
          ));

      setState(() {
        _animated = false;
      });
    }

    return Scaffold(
        body: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: _animated ? 1 : 0),
                duration: const Duration(milliseconds: 1500),
                builder: (context, double value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: Offset(
                              0,
                              _animated
                                  ? -200 * value
                                  : -200 * (1 - _animation.value)),
                          child: Container(
                            height: size.height * 0.1,
                            padding: const EdgeInsets.only(right: 15),
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Transform.rotate(
                                      angle: pi * _arrowAnimation.value,
                                      child: const Icon(
                                        Icons.arrow_right_alt_sharp,
                                        size: 40,
                                      )),
                                ),
                                const Text(
                                  'Burgers',
                                  style: TextStyle(
                                      fontFamily: 'PBold',
                                      color: Colors.black,
                                      letterSpacing: 1,
                                      fontSize: 18),
                                ),
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
                              _animated
                                  ? 600 * value
                                  : 600 * (1 - _animation.value),
                              0),
                          child: Container(
                            margin: EdgeInsets.zero,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${widget.products.length - 5}+ Results Found ',
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'QBold',
                                    fontSize: 32,
                                    letterSpacing: 1,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.stacked_bar_chart_rounded,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Transform.translate(
                            offset: Offset(
                                0,
                                /* _animated
                                    ? size.height * .8 * _animation.value
                                    : */

                                (size.height * .8) * (1 - _animation.value)),
                            child: Opacity(
                              opacity: 1 - value,
                              child: Container(
                                margin: EdgeInsets.zero,
                                width: 500,
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: .6,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemCount: widget.products.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _animated = true;
                                        });
                                        Future.delayed(
                                          const Duration(milliseconds: 600),
                                          () {},
                                        );

                                        _openSpecsPage(
                                            context, widget.products[index]);
                                      },
                                      child: CardBurger(
                                        product: widget.products[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }));
  }
}

class CardBurger extends StatelessWidget {
  final Hamburger product;
  const CardBurger({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0XFFFAEEDE),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Hero(
                tag: product.img,
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.zero,
                    child: Image.asset(product.img, fit: BoxFit.contain),
                  ),
                ),
              )),
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontFamily: 'OBold')),
                  Text(product.description,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontFamily: 'ORegular')),
                  Text('\$${product.price}',
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontFamily: 'OBold'))
                ],
              )),
          Positioned(
            bottom: -10,
            right: -5,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: const Color(0XFFFAEEDE),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(17.5)),
              margin: EdgeInsets.zero,
              child: const Center(
                child: Icon(Icons.shopping_bag_outlined,
                    size: 20, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
