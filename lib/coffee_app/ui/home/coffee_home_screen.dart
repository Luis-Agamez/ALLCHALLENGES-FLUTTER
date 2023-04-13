import 'package:app_one/coffee_app/global/styles.dart';
import 'package:flutter/material.dart';

import '../../domain/data/data.dart';
import '../splash/splash_screen.dart';
import '../widgets/coffee_carrousel.dart';
import '../widgets/frozen_carrousel.dart';

class CoffeeHomeScreen extends StatefulWidget {
  const CoffeeHomeScreen({super.key});

  @override
  State<CoffeeHomeScreen> createState() => _CoffeeHomeScreenState();
}

class _CoffeeHomeScreenState extends State<CoffeeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColorLight,
        body: Container(
          padding: const EdgeInsets.only(bottom: 80, top: 30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, animation, __) {
                                    return const SplashScreen();
                                  },
                                ),
                              );
                            },
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.restart_alt,
                                  size: 25,
                                  color: primaryColor,
                                )),
                          )
                        ],
                      )),
                ),
                CarrouselCoffe(
                  coffees: coffees,
                ),
                FrozenCarrousel(
                  frozens: frozen,
                )
              ]),
        ));
  }
}
