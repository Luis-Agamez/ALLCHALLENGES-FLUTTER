import 'package:app_one/hamburger_app/domain/entities/product.dart';
import 'package:flutter/material.dart';

import '../../../domain/data/data.dart';
import '../../swiper/swiper_screen.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct({super.key, required this.product});
  static const double height = 420.00;
  static const double width = 280.00;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 1500),
              pageBuilder: (context, animation, secondaryAnimation) {
                return SwiperScreen(products: hamburgers);
              },
            ));
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: product.color)),
            ),
            Positioned(
                top: 30,
                left: -30,
                right: -30,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.zero,
                    width: 450,
                    height: 340,
                    child: Image.asset(product.img, fit: BoxFit.fill),
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(product.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'OBold',
                          fontSize: 30,
                        )),
                    Text('${product.items} Items',
                        style: TextStyle(
                            color: product.textColor,
                            fontFamily: 'OBold',
                            fontSize: 15,
                            letterSpacing: 1))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
