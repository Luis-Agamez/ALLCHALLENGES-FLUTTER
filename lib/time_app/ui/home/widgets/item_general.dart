import 'package:flutter/material.dart';

class ItemGeneral extends StatelessWidget {
  const ItemGeneral({
    super.key,
    required this.isColorBackground,
    required this.isColorText,
    required this.isColorTemperature,
    required this.clime,
    required this.urlImage,
    required this.date,
    required this.temperature,
  });

  final bool isColorBackground;
  final bool isColorText;
  final bool isColorTemperature;

  final String clime;
  final String urlImage;
  final String date;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: 75,
      height: 240,
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
              color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                clime,
                style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1,
                    color: isColorText ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                date,
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1,
                    color: isColorText ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Center(
            child: Container(
                width: 60,
                height: 60,
                child: Image.asset(
                  urlImage,
                  fit: BoxFit.contain,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  temperature,
                  style: TextStyle(
                      fontSize: 32,
                      letterSpacing: 1,
                      color: isColorText ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isColorTemperature ? Colors.red : Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      temperature,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 12, letterSpacing: 1),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
