import 'dart:ui';
import 'package:app_one/motorcycle_app/ui/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/motorcycle.dart';
import 'motorcycle_card_standard.dart';

class MotorcycleCarrouselStandard extends StatefulWidget {
  const MotorcycleCarrouselStandard(
      {Key? key, required this.title, required this.motorcycles})
      : super(key: key);
  final String title;
  final List<Motorcycle> motorcycles;
  @override
  State<MotorcycleCarrouselStandard> createState() =>
      _MotorcycleCarrouselState();
}

class _MotorcycleCarrouselState extends State<MotorcycleCarrouselStandard> {
  late PageController _pageController;
  int prevewPage = 0;
  bool _animated = false;
  double _page = 0;

  @override
  void initState() {
    _pageController = PageController();
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
          height: MotorcycleCardStandard.height + 120,
          child: ListView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: widget.motorcycles.length,
            itemBuilder: (context, index) {
              final data = lerpDouble(1, .9, (_page - index).abs());
              // print(data);
              return Container(
                margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: MotorcycleCardStandard(
                    motorcycle: widget.motorcycles[index],
                    onTap: () => openDetails(widget.motorcycles[index])),
              );
            },
          ),
        )
      ],
    );
  }
}
