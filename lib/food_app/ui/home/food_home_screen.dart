import 'package:app_one/food_app/domain/data/data.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/pizza.dart';
import '../details/detail_screen.dart';
import 'widgets/search_app_bar.dart';

class FoodHomeScreen extends StatelessWidget {
  const FoodHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFF),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Fast Food,',
                  style: TextStyle(
                      fontFamily: 'PRegular',
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 32),
                ),
                Text(
                  'Fast Delivery,',
                  style: TextStyle(
                      fontFamily: 'PBold',
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 32),
                ),
                SearchAppBar(),
                ListMenuItem(),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.zero,
                width: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: pizzas.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GeneralCard(
                      isFavorite: false,
                      pizza: pizzas[index],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListMenuItem extends StatelessWidget {
  const ListMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      width: double.infinity,
      height: 80,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            MenuItem(
              imgUrl: 'assets/foodImg/pizza.png',
              label: 'Pizza',
              isSelected: true,
            ),
            MenuItem(
              imgUrl: 'assets/foodImg/burger.png',
              label: 'Burger',
              isSelected: false,
            ),
            MenuItem(
              imgUrl: 'assets/foodImg/snack.png',
              label: 'Snack',
              isSelected: false,
            )
          ]),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key,
      required this.imgUrl,
      required this.label,
      required this.isSelected});

  final String imgUrl;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? const Color(0xFFFFDF9B) : Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.zero,
                width: 30,
                height: 30,
                child: Image.asset(imgUrl, fit: BoxFit.cover)),
          ),
          Text(
            label,
            style: const TextStyle(
                fontFamily: 'PMedium',
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class GeneralCard extends StatelessWidget {
  const GeneralCard({super.key, required this.isFavorite, required this.pizza});
  final bool isFavorite;
  final Pizza pizza;

  void _openSpecsPage(BuildContext context, Pizza pizza) async {
    await Navigator.push(
        context,
        PageRouteBuilder(
          reverseTransitionDuration: const Duration(milliseconds: 750),
          transitionDuration: const Duration(milliseconds: 1500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
                opacity: animation, child: DetailsScreen(pizza: pizza));
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        /* Navigator.push(context, PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return DetailsScreen(pizza: pizza);
          },);
        */
        _openSpecsPage(context, pizza);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Positioned(
                bottom: size.height * .01,
                left: 10,
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pizza.name,
                          style: const TextStyle(
                              fontFamily: 'PMedium',
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: 18),
                        ),
                        Text(
                          'With  ${pizza.pricipal}',
                          style: const TextStyle(
                              fontFamily: 'PRegular',
                              color: Colors.grey,
                              letterSpacing: 1,
                              fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.zero,
                          child: Row(
                            children: [
                              Text('\$',
                                  style: TextStyle(
                                      fontFamily: 'PMedium',
                                      color: Colors.yellow[900],
                                      letterSpacing: 1,
                                      fontSize: 10)),
                              Text('${pizza.price}',
                                  style: const TextStyle(
                                      fontFamily: 'PBold',
                                      color: Colors.black,
                                      letterSpacing: 1,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.favorite_border_outlined,
                          size: 32,
                          color:
                              isFavorite ? Colors.red[900] : Colors.grey[700],
                        )
                      ],
                    )
                  ],
                )),
            Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Hero(
                  tag: pizza.name,
                  child: Center(
                    child: Container(
                      width: 160,
                      height: 160,
                      margin: EdgeInsets.zero,
                      child: Image.asset(pizza.image, fit: BoxFit.contain),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
