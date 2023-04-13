import 'package:app_one/coffee_app/domain/data/data.dart';
import 'package:app_one/coffee_app/domain/models/coffee.dart';
import 'package:flutter/material.dart';

import '../../global/styles.dart';
import 'coffee_card.dart';

class CarrouselCoffe extends StatefulWidget {
  const CarrouselCoffe({super.key, required this.coffees});
  final List<Coffee> coffees;
  @override
  State<CarrouselCoffe> createState() => _CarrouselCoffeState();
}

class _CarrouselCoffeState extends State<CarrouselCoffe> {
  late PageController _pageController;
  int i = 0;
  int prevewPage = 0;
  bool _animated = false;
  double _page = 0;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: .6,
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
    const heigth = CoffeCard.height;
    print(_pageController.keepScrollOffset);
    return Column(
      children: [
        Text(
          'Sellect',
          style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              letterSpacing: 1,
              fontFamily: 'PMedium'),
        ),
        Text(
          'Coffee',
          style: TextStyle(
              color: primaryColor,
              fontSize: 42,
              letterSpacing: 1,
              fontFamily: 'CRegular'),
        ),
        SizedBox(
          width: 150,
          height: 8,
          child: ListView.builder(
            itemCount: coffees.length,
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
        SizedBox(
            height: heigth,
            child: PageView.builder(
              controller: _pageController,
              itemCount: coffees.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CoffeCard(coffee: widget.coffees[index]));
              },
              onPageChanged: (int page) {
                setState(() {
                  i = page;
                });
              },
            )),
      ],
    );
  }
}
