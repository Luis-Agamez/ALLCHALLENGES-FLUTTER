import 'package:app_one/hamburger_app/domain/data/data.dart';
import 'package:app_one/hamburger_app/domain/entities/product.dart';
import 'package:app_one/hamburger_app/ui/home/widgets/card_product.dart';
import 'package:flutter/material.dart';

class CorrouselProducts extends StatefulWidget {
  final List<Product> products;
  const CorrouselProducts({super.key, required this.products});

  @override
  State<CorrouselProducts> createState() => _CorrouselProductsState();
}

class _CorrouselProductsState extends State<CorrouselProducts> {
  late PageController _pageController;
  int prevewPage = 0;
  bool _animated = false;
  double _page = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 2,
      viewportFraction: .75,
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
    return SizedBox(
      width: CardProduct.width,
      height: CardProduct.height,
      child: PageView(
        controller: _pageController,
        children: List.generate(
            products.length,
            (index) => Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: CardProduct(product: products[index]),
                )),
      ),
    );
  }
}
