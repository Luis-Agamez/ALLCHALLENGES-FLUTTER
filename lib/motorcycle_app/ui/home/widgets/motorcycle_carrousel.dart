import 'dart:math';
import 'dart:ui';

import 'package:app_one/motorcycle_app/ui/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/motorcycle.dart';
import 'motorcycle_card_deluxe.dart';

class MotorcycleCarrousel extends StatefulWidget {
  const MotorcycleCarrousel(
      {Key? key, required this.title, required this.motorcycles})
      : super(key: key);
  final String title;
  final List<Motorcycle> motorcycles;
  @override
  State<MotorcycleCarrousel> createState() => _MotorcycleCarrouselState();
}

class _MotorcycleCarrouselState extends State<MotorcycleCarrousel> {
  late PageController _pageController;
  int prevewPage = 0;
  bool _animated = false;
  double _page = 0;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: .65,
    );
    _pageController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    setState(() {
      _page = _pageController.page!;
    });
  }

  void openDetails(Motorcycle motorcycle) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, animation, animation2) {
          return FadeTransition(
            opacity: animation,
            child: DetailsScreen(
              motorcycle: motorcycle,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(onScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  print(_page);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MotorcycleCardDeluxe.height,
          child: PageView(
            controller: _pageController,
            children: List.generate(widget.motorcycles.length, (index) {
              final data = lerpDouble(1, .9, (_page - index).abs());
              // print(data);
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0025 * data!)
                  ..rotateY(pi * (2 * data)),
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: MotorcycleCardDeluxe(
                      motorcycle: widget.motorcycles[index],
                      onTap: () => openDetails(widget.motorcycles[index])),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
