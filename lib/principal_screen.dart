import 'package:flutter/material.dart';
import 'global/data/screens.dart';
import 'global/ui/card_screen.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFF0A1317),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
              child: ListView.builder(
            itemCount: screens.length,
            itemBuilder: (context, index) {
              return CardScreen(
                screen: screens[index].screen,
                screenName: screens[index].screenName,
              );
            },
          )),
        ));
  }
}
