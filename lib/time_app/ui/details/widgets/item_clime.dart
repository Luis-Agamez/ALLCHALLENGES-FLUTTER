import 'package:flutter/material.dart';

class ItemClime extends StatelessWidget {
  const ItemClime({
    super.key,
    required this.isColorBackground,
    required this.time,
    required this.urlImg,
    required this.temperature,
  });

  final bool isColorBackground;
  final String time;
  final String urlImg;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: 100,
      height: 160,
      decoration: isColorBackground
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.center,
                  stops: [
                    0.2,
                    0.8
                  ],
                  colors: [
                    Colors.purple,
                    Color.fromARGB(255, 62, 5, 218),
                  ]))
          : BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.black.withOpacity(0.25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Center(
            child: Container(
                width: 60,
                height: 60,
                child: Image.asset(
                  urlImg,
                  fit: BoxFit.contain,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              temperature,
              style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }
}
