import 'package:app_one/bank_app/domain/models/card.dart';
import 'package:app_one/bank_app/ui/constant.dart';
import 'package:app_one/bank_app/ui/details/widgets/card.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.card});

  final CardData card;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColorDark,
      body: Stack(
        children: [
          const Positioned(
              top: 20,
              left: 20,
              right: 0,
              child: Text('Details',
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'PMedium',
                      fontSize: 24))),
          Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Hero(tag: card.bankName, child: CardItem(card: card))),
          Positioned(
              top: size.height * .4,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: size.height * .6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Description',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontFamily: 'PMedium',
                            fontSize: 28)),
                    Text(
                        'This card is completely reserved and completely private, authorized by the financial institution to carry out a large number of transactions between different entities. The use of this card is entirely the responsibility of the user.',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontFamily: 'PRegular',
                            fontSize: 18)),
                    RowItem(
                      title: 'To name :',
                      description: 'Luis Miguel Agamez',
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontFamily: 'PMedium',
                  fontSize: 20)),
          Text(description,
              style: const TextStyle(
                  color: Colors.grey,
                  letterSpacing: 1,
                  fontFamily: 'PBold',
                  fontSize: 20)),
        ],
      ),
    );
  }
}
