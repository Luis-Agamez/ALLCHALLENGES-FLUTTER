import 'package:flutter/material.dart';

class Product {
  final String name;
  final String img;
  final Color color;
  final int items;
  final Color textColor;

  Product(
      {required this.name,
      required this.img,
      required this.color,
      required this.items,
      required this.textColor});
}
