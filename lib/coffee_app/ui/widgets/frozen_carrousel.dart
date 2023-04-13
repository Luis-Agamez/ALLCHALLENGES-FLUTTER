import 'package:app_one/coffee_app/domain/data/data.dart';
import 'package:app_one/coffee_app/domain/models/coffee.dart';
import 'package:flutter/material.dart';

import '../../global/styles.dart';
import 'frozen_card.dart';

class FrozenCarrousel extends StatefulWidget {
  const FrozenCarrousel({super.key, required this.frozens});
  final List<Coffee> frozens;
  @override
  State<FrozenCarrousel> createState() => _FrozenCarrouselState();
}

class _FrozenCarrouselState extends State<FrozenCarrousel> {
  late PageController _pageController;
  int i = 0;
  int prevewPage = 0;
  bool _animated = false;
  double _page = 0;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: .8,
    );
    _pageController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    setState(() {
      _page = _pageController.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    const heigth = FrozenCard.height;

    return Column(
      children: [
        SizedBox(
            height: heigth,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.frozens.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FrozenCard(frozen: widget.frozens[index]));
              },
              onPageChanged: (int page) {
                setState(() {
                  i = page;
                });
              },
            )),
        const SizedBox(height: 10),
        SizedBox(
          width: 150,
          height: 8,
          child: ListView.builder(
            itemCount: widget.frozens.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                  margin: const EdgeInsets.only(right: 10),
                  duration: const Duration(milliseconds: 600),
                  width: i == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: i == index ? primaryColor : Colors.grey,
                      borderRadius: BorderRadius.circular(5)));
            },
          ),
        ),
      ],
    );
  }
}
