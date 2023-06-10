import 'package:app_one/hamburger_app/domain/entities/hamburger.dart';
import 'package:flutter/material.dart';

class CardOrderProduct extends StatelessWidget {
  final Hamburger product;
  final int index;

  const CardOrderProduct(
      {super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isOdd = index % 2 == 0;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 150,
      width: size.width * .85,
      child: Stack(children: [
        Positioned.fill(
            child: Container(
                decoration: BoxDecoration(
          color: const Color(0XFF0E0D14),
          borderRadius: BorderRadius.circular(20),
        ))),
        Positioned(
            left: 0,
            bottom: 0,
            right: size.width * .6,
            top: 0,
            child: Container(
              width: size.width * .3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0XFF1F1F23)),
            )),
        Positioned.fill(
            left: size.width * .33,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'OBold')),
                    Text(product.description,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 1,
                            fontFamily: 'ORegular'))
                  ],
                ),
                const Text('Size : m',
                    style: TextStyle(
                        fontSize: 14, color: Colors.grey, fontFamily: 'OBold')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Quantity : 1',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontFamily: 'OBold')),
                    const SizedBox(width: 20),
                    Text('\$${product.price}',
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'OBold')),
                  ],
                )
              ],
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: size.width * .55,
          child: Center(
            child: Container(
              margin: EdgeInsets.zero,
              width: 150,
              height: 150,
              child: Image.asset(product.img),
            ),
          ),
        )
      ]),
    );
  }
}
