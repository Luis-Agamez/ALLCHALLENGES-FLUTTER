import 'package:flutter/material.dart';

class CardClime extends StatelessWidget {
  const CardClime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 230,
      margin: const EdgeInsets.only(right: 5, top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 62, 5, 218),
              spreadRadius: 5,
              blurRadius: 1,
              offset: Offset(9, 4), // changes position of shadow
            ),
            BoxShadow(
              color: Color.fromARGB(255, 62, 5, 218),
              spreadRadius: 5,
              blurRadius: 1,
              offset: Offset(9, 4), // changes position of shadow
            ),
          ],
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
              ])),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              top: 10,
              left: 10,
              child: Center(
                child: Container(
                    width: 120,
                    height: 120,
                    child: Image.asset(
                      'assets/img/sun1.png',
                      fit: BoxFit.contain,
                    )),
              )),
          Positioned(
              right: 10,
              top: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    '21º',
                    style: TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Feels like 26',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ],
              )),
          Positioned(
              bottom: 20,
              left: 10,
              child: Column(
                children: const [
                  Text(
                    'Rin showers ',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Monday,12 Feb',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )),
          Positioned(
              bottom: 30,
              right: 30,
              child: Row(
                children: [
                  Icon(
                    Icons.ac_unit_outlined,
                    size: 52,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  Icon(
                    Icons.air_outlined,
                    size: 52,
                    color: Colors.white.withOpacity(0.2),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
