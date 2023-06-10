import 'dart:math';

import 'package:app_one/hamburger_app/domain/data/data.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/hamburger.dart';
import '../../domain/entities/ingredients.dart';

class DetailsScreen extends StatefulWidget {
  final Hamburger hamburguer;
  const DetailsScreen({super.key, required this.hamburguer});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerArrows;

  late Animation<double> _animationArrow1;
  late Animation<double> _animationArrow2;
  late Animation<double> _animationArrow3;

  @override
  void initState() {
    super.initState();
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

    _animationControllerArrows.forward();

    _animationControllerArrows.addListener(() {
      if (_animationControllerArrows.isCompleted) {
        _animationControllerArrows.repeat();
      }
    });
  }

  @override
  void dispose() {
    _animationControllerArrows.removeListener(() {});
    _animationControllerArrows.dispose();
    super.dispose();
  }

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
            ..translate(60 * value, 300 * value, 0)
            ..scale(1 + .3 * value),
          child: child,
        );
      },
      child: _Image(url: widget.hamburguer.img),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              top: size.height * .3,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 248, 234, 213),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
              )),
          Positioned(
              left: 20,
              right: 20,
              top: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Transform.rotate(
                        angle: pi,
                        child: const Icon(
                          Icons.arrow_right_alt_sharp,
                          size: 40,
                        )),
                  ),
                  const Text(
                    'Food Details',
                    style: TextStyle(
                        fontFamily: 'PBold',
                        color: Colors.black,
                        letterSpacing: 1,
                        fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline_rounded,
                          size: 28, color: Colors.black))
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: 140,
              child: Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: size.width,
                height: size.height * .12,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * .62,
                      height: size.height * .12,
                      child: Text(
                        widget.hamburguer.name,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'QBold',
                          fontSize: 36,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Text(
                      '\$${widget.hamburguer.price}',
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'OBold',
                        fontSize: 34,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: AnimatedBuilder(
                animation: _animationControllerArrows,
                builder: (_, __) {
                  return GestureDetector(
                    onHorizontalDragDown: (details) {
                      print(details.localPosition.dx);
                    },
                    child: Container(
                      width: size.width,
                      height: 60,
                      padding: const EdgeInsets.only(right: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(
                          color: const Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: _animationControllerArrows,
                            builder: (context, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: size.width * .2,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color(0XFFF2E5D2),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.shopping_bag_outlined,
                                        size: 32,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: .5 + (.5 * _animationArrow1.value),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                  ),
                                  Opacity(
                                    opacity: .5 + (.5 * _animationArrow2.value),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                  ),
                                  Opacity(
                                    opacity: .5 + (.5 * _animationArrow3.value),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.grey.withOpacity(.5),
                                      size: 18,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                          const Text('Add To Cart',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OBold',
                                  fontSize: 18,
                                  letterSpacing: 1)),
                        ],
                      ),
                    ),
                  );
                },
              )),
          Positioned(
              top: size.height * .7,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                height: size.height * .15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    return Container(
                        width: size.width * .22,
                        height: size.height * .1,
                        margin: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IngredientCard(ingredient: ingredients[index])
                          ],
                        ));
                  },
                ),
              )),
          Positioned(
              top: 0,
              left: 0,
              child: Hero(
                tag: widget.hamburguer.img,
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
                  return _flightShuttleBuilder(animation, flightDirection);
                },
                child: Transform.translate(
                  offset: const Offset(60, 300),
                  child: Transform.scale(
                      scale: 1.3, child: _Image(url: widget.hamburguer.img)),
                ),
              ))
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 280,
        height: 280,
        margin: EdgeInsets.zero,
        child: Image.asset(
          url,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class IngredientCard extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientCard({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 248, 234, 213),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            width: 60,
            height: 60,
            child: Center(
              child: Container(
                margin: EdgeInsets.zero,
                width: 30,
                height: 30,
                child: Image.asset(ingredient.img, fit: BoxFit.contain),
              ),
            ),
          ),
          Text(ingredient.name,
              style: const TextStyle(
                  fontSize: 15, color: Colors.black, fontFamily: 'OBold')),
          Text('${ingredient.cal} cal',
              style: const TextStyle(
                  fontSize: 15, color: Colors.black, fontFamily: 'OBold'))
        ],
      ),
    );
  }
}
