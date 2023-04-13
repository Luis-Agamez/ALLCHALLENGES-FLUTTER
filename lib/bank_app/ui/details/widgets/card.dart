import 'package:flutter/material.dart';
import '../../../domain/models/card.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.card,
  });

  final CardData card;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(size.width * .05),
      child: Container(
          width: size.width * .9,
          height: size.height * .255,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * .05),
            color: card.color,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 10,
                top: 10,
                child: Text(
                  card.bankName.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'PBold',
                      letterSpacing: 1),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * .075,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(size.width * .05),
                        bottomRight: Radius.circular(size.width * .05)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '08/25'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'PMedium',
                                  letterSpacing: 1),
                            ),
                            Text(
                              'Luis Miguel Agamez'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'PMedium',
                                  letterSpacing: 1),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ''.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'PMedium',
                                  letterSpacing: 1),
                            ),
                            Text(
                              '******1226'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'PMedium',
                                  letterSpacing: 1),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: size.height * .0325,
                  left: 0,
                  right: 0,
                  bottom: size.height * .075,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Card Balance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'PMedium',
                                  letterSpacing: 1),
                            ),
                            Text(
                              '\$${card.current}'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: 'PMedium',
                                  letterSpacing: 1),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.wifi_tethering_sharp,
                          size: 48,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  top: 0,
                  right: 10,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.zero,
                      width: 50,
                      height: 50,
                      child: Image.asset(card.logo),
                    ),
                  )),
            ],
          )),
    );
  }
}
