import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import '../../domain/data/data.dart';
import '../../domain/models/travel_model.dart';
import '../painters/painter_optional.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.travel}) : super(key: key);
  final Travel travel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int indexSelected = 0;
  ui.Image? image;
  @override
  void initState() {
    // loadImage(widget.travel.images[0]);
    super.initState();
  }

  Future loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);
    setState(() => this.image = image);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const expandDuration = Duration(milliseconds: 400);
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        margin: EdgeInsets.zero,
        width: double.infinity,
        height: size.height * .1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Text(
                '\$${widget.travel.price.toInt()}',
                style: const TextStyle(
                    fontSize: 32,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const Text(
                '/ package',
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              )
            ]),
            Container(
              width: size.width * 0.5,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 208, 95, 15),
                  borderRadius: BorderRadius.circular(50)),
              child: const Center(
                child: Text(
                  'Book now',
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
      body: Stack(fit: StackFit.expand, children: [
        AnimatedPositioned(
            duration: expandDuration,
            curve: Curves.fastOutSlowIn,
            height: size.height * .52,
            bottom: size.height * .45,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(widget.travel.images[indexSelected],
                        fit: BoxFit.cover)),
                Positioned(
                  left: size.width * .1,
                  bottom: size.height * .2,
                  child: const Text('Whittier',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700)),
                ),
                Positioned(
                    left: size.width * .35,
                    bottom: size.height * .16,
                    child: Container(
                      padding: EdgeInsets.only(left: size.width * .05),
                      width: size.width * .3,
                      height: size.height * .04,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: widget.travel.images.length,
                        itemBuilder: (context, index) {
                          return Indicator(
                            indexSelected: indexSelected,
                            index: index,
                          );
                        },
                      ),
                    ))
              ],
            )),
        AnimatedPositioned(
          duration: expandDuration,
          curve: Curves.fastOutSlowIn,
          top: size.height * .4,
          left: 0,
          right: 0,
          height: size.height * .6,
          child: CustomPaint(
            painter: PainterOptional(curveRadius: 30),
            child: Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[900],
                            size: 26,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            '5.0',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.travel_explore_outlined,
                                color: Colors.red[400],
                                size: 26,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Hill',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 60),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: size.height * .21,
                        child: SingleChildScrollView(
                          child: Text(
                            widget.travel.description,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: const [
                      Text(
                        'Gallery',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.zero,
                    width: size.width,
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.travel.images.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  setState(() {
                                    indexSelected = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 80,
                                  height: 70,
                                  child: Opacity(
                                    opacity: indexSelected == index ? 1 : .6,
                                    child: Image.asset(
                                        widget.travel.images[index],
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            )),
          ),
        ),
      ]),
    );
  }
}

class Indicator extends StatefulWidget {
  const Indicator({
    super.key,
    required this.indexSelected,
    required this.index,
  });

  final int indexSelected;
  final int index;

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      curve: Curves.bounceInOut,
      duration: const Duration(milliseconds: 1000),
      builder: (context, value, child) {
        return Center(
          child: AnimatedContainer(
            curve: Curves.easeInOutCubic,
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: widget.indexSelected == widget.index
                    ? Colors.white
                    : Colors.white.withOpacity(0.5)),
            width: widget.indexSelected == widget.index ? 10 + 14 * value : 10,
            height: widget.indexSelected == widget.index ? 2 + 3 * value : 2,
          ),
        );
      },
    );
  }
}
