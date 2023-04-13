import 'package:flutter/material.dart';

import '../../domain/models/motorcycle.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.motorcycle}) : super(key: key);
  final Motorcycle motorcycle;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _imageAnimationController;
  late Animation<double> _backgroundAnimation1;
  late Animation<double> _backgroundAnimation2;
  late Animation<double> _backgroundAnimation3;
  int indexPosition = 0;
  bool animatedCircle = false;
  bool animatedImage = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _imageAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _backgroundAnimation1 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.5, curve: Curves.easeInOut));
    _backgroundAnimation2 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 0.8, curve: Curves.easeInOut));
    _backgroundAnimation3 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1.0, curve: Curves.easeInOut));

    _animationController.forward();
    _imageAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _imageAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const animationDuration = Duration(milliseconds: 300);
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.arrow_back_ios,
                            size: 32, color: Color(0XFF1D1237)),
                        Icon(Icons.favorite_border,
                            size: 32, color: Color(0XFF1D1237))
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  final postionValue1 = _backgroundAnimation1.value;
                  final postionValue2 = _backgroundAnimation2.value;
                  return Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: size.height * .55,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.motorcycle.maker,
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueGrey.withOpacity(0.9)),
                                ),
                                Text(
                                  widget.motorcycle.name,
                                  style: const TextStyle(
                                      fontSize: 38,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(255, 24, 20, 20)),
                                ),
                                const SizedBox(height: 20),
                                Transform.translate(
                                  offset: Offset(80 * (1 - postionValue1), 0),
                                  child: Opacity(
                                    opacity: postionValue1,
                                    child: Text(
                                      widget.motorcycle.description,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1,
                                          color:
                                              Colors.blueGrey.withOpacity(0.9)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.translate(
                                      offset:
                                          Offset(40 * (1 - postionValue1), 0),
                                      child: Opacity(
                                        opacity: postionValue1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star_outlined,
                                              size: 38,
                                              color: Colors.grey[350],
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              '4.2',
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w900,
                                                  color: Color.fromARGB(
                                                      255, 24, 20, 20)),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'rewiews(258)',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1,
                                                  color: Colors.blueGrey
                                                      .withOpacity(0.9)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.translate(
                                      offset:
                                          Offset(20 * (1 - postionValue1), 0),
                                      child: const Text('Specifications',
                                          style: TextStyle(
                                              fontSize: 34,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 24, 20, 20))),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Transform.translate(
                                          offset: Offset(
                                              360 * (1 - postionValue2), 0),
                                          child: const PropertyCard(
                                              icon: Icon(
                                                  Icons
                                                      .sports_motorsports_rounded,
                                                  size: 52),
                                              labelText: 'Engine',
                                              value: '492 cc'),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              480 * (1 - postionValue2), 0),
                                          child: const PropertyCard(
                                              icon: Icon(
                                                  Icons.one_k_plus_rounded,
                                                  size: 52),
                                              labelText: 'Wight',
                                              value: '210 Kg'),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              580 * (1 - postionValue2), 0),
                                          child: const PropertyCard(
                                              icon: Icon(Icons.speed_outlined,
                                                  size: 52),
                                              labelText: 'Max speed',
                                              value: '143 mph'),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    height: 80,
                    child: Row(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        width: size.width / 2,
                        color: Colors.white,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('${widget.motorcycle.price}\$',
                                  style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0XFFFF7B01))),
                              const Text('/ Week',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFFFF7B01)))
                            ]),
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20)),
                        child: Container(
                          width: size.width / 2,
                          decoration: const BoxDecoration(
                              color: Color(0XFF1D1237),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20))),
                          child: const Center(
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ]),
                  )),
              Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  bottom: size.height * 0.66,
                  child: Hero(
                      tag: widget.motorcycle.name,
                      child: TweenAnimationBuilder<double>(
                        curve: Curves.ease,
                        key: Key(animatedImage.toString()),
                        duration: animationDuration,
                        tween: Tween(begin: animatedImage ? 1 : 0, end: 0),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset:
                                Offset(animatedImage ? -300 * (value) : 0, 0),
                            child: Image.asset(
                                widget.motorcycle.images[indexPosition]),
                          );
                        },
                      ))),
              Positioned(
                bottom: size.height * 0.6 + 20,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: 100,
                  child: Container(
                    height: 30,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.motorcycle.colors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              animatedCircle = true;
                              indexPosition = index;
                            });

                            setState(() {
                              animatedImage = !animatedImage;
                              if (animatedImage) {
                                Future.delayed(animationDuration, () {
                                  setState(() {
                                    animatedImage = false;
                                  });
                                });
                              }
                            });

                            Future.delayed(const Duration(milliseconds: 150),
                                () {
                              setState(() {
                                animatedCircle = false;
                              });
                            });
                          },
                          child: Transform.scale(
                            scale: animatedCircle && indexPosition == index
                                ? 0.9
                                : 1,
                            child: ColorCircle(
                              isSelected: indexPosition == index ? true : false,
                              color: widget.motorcycle.colors[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 40,
                  right: 20,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final postionValue3 = _backgroundAnimation3.value;
                      return Opacity(
                          opacity: postionValue3,
                          child: Center(
                              child: Container(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(
                                    widget.motorcycle.makerImg,
                                    fit: BoxFit.contain,
                                  ))));
                    },
                  ))
            ],
          ),
        ));
  }
}

class PropertyCard extends StatelessWidget {
  const PropertyCard(
      {Key? key,
      required this.icon,
      required this.labelText,
      required this.value})
      : super(key: key);
  final Icon icon;
  final String labelText;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 120,
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        icon,
        Text(
          labelText,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey.withOpacity(0.9)),
        ),
        Text(
          value,
          style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 24, 20, 20)),
        ),
      ]),
    );
  }
}

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    super.key,
    required this.color,
    required this.isSelected,
  });
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.only(left: 30),
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: color,
                boxShadow: const [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 6, blurRadius: 0),
                    BoxShadow(
                        color: Colors.white, spreadRadius: 3, blurRadius: 0),
                  ])
            : BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: color,
              ));
  }
}
