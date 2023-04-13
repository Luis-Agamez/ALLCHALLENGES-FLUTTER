import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../home/home_screen.dart';

class CircleHistory extends StatelessWidget {
  const CircleHistory({super.key, required this.name, required this.imgUrl});
  final String name;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(
              width: 3,
              color: HomeScreenSocialApp.primaryColor,
            )),
        child: CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(imgUrl),
        ),
      ),
      Text(
        name,
        style: const TextStyle(
            color: Colors.white,
            fontFamily: 'PRegular',
            letterSpacing: 1,
            fontSize: 12),
      ),
    ]);
  }
}
