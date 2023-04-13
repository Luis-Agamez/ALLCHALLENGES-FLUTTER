import 'package:flutter/material.dart';

class ItemRelativeData extends StatelessWidget {
  const ItemRelativeData({
    super.key,
    required this.imgUrl,
    required this.data,
    required this.label,
  });
  final String imgUrl;
  final String data;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
              width: 60,
              height: 60,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.contain,
              )),
        ),
        Text(
          data,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
