import 'package:flutter/material.dart';

class CardTravel {
  final String originName;
  final String originInitials;
  final String originDestiny;
  final String destinyInitials;
  final String number;
  final String hours;
  final String date;
  final int price;

  CardTravel(
      {required this.originName,
      required this.originInitials,
      required this.originDestiny,
      required this.destinyInitials,
      required this.number,
      required this.hours,
      required this.date,
      required this.price});
}
