import 'package:flutter/material.dart';

class CardData {
  final String bankName;
  final String numberCard;
  final double current;
  final String logo;
  final String img;
  final Color color;

  CardData(
      {required this.bankName,
      required this.numberCard,
      required this.current,
      required this.logo,
      required this.img,
      required this.color});
}
