import 'package:flutter/material.dart';

class CardResult extends StatelessWidget {
  const CardResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              child: Image.asset(
                'assets/arquitectImg/home_1_2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )),
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'For Sale',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Column(
              children: [
                const Text('Ibe House',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500)),
                Row(
                  children: const [
                    ItemData(),
                    ItemData(),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('3,400,00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    )),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber[900],
                    ),
                    const SizedBox(width: 5),
                    const Text('4.3 Revews',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemData extends StatelessWidget {
  const ItemData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on, size: 14),
        Text(
          ' Los Angeles',
        )
      ],
    );
  }
}
