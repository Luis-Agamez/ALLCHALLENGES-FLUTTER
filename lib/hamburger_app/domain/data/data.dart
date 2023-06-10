import 'package:flutter/material.dart';

import '../entities/hamburger.dart';
import '../entities/ingredients.dart';
import '../entities/item.dart';
import '../entities/product.dart';

final List<Hamburger> hamburgers = [
  Hamburger(
      name: 'bacon cheeseburger',
      img: 'assets/burgerImg/hamburguer_5.png',
      description: 'Most Cheese Burger',
      price: 12.67),
  Hamburger(
      name: 'Hamburger French',
      img: 'assets/burgerImg/burger_1.png',
      description: 'Double Carn',
      price: 12.67),
  Hamburger(
      name: 'Hamburger Cheesebur',
      img: 'assets/burgerImg/hamburguer_14.png',
      description: 'Simple Burger',
      price: 12.67),
  Hamburger(
      name: 'Hamburger Chess',
      img: 'assets/burgerImg/hamburguer_13.png',
      description: 'Double Burger',
      price: 12.67),
  Hamburger(
      name: 'Hamburger Veggie',
      img: 'assets/burgerImg/hamburguer_15.png',
      description: 'Double Vegetable',
      price: 12.67),
  Hamburger(
      name: ' Hamburger Whopper',
      img: 'assets/burgerImg/hamburguer_11.png',
      description: 'Burger Chicken',
      price: 12.67),
  Hamburger(
      name: 'Chicken sandwich',
      img: 'assets/burgerImg/hamburguer_16.png',
      description: 'Chicken Broster',
      price: 12.67),
  Hamburger(
      name: 'Hamburger Fatburger',
      img: 'assets/burgerImg/hamburguer_9.png',
      description: 'Triple Burger',
      price: 12.67),
  Hamburger(
      name: 'Hamburger Whoppert',
      img: 'assets/burgerImg/hamburguer_7.png',
      description: 'Duoble cheese',
      price: 12.67),
  Hamburger(
      name: 'Hamburger French',
      img: 'assets/burgerImg/hamburguer_12.png',
      description: 'Double Burger',
      price: 12.67),
  Hamburger(
      name: 'Hamburger Bacon',
      img: 'assets/burgerImg/hamburguer_1.png',
      description: 'Burger Tocineta',
      price: 12.67),
  Hamburger(
      name: 'Hamburger KFC',
      img: 'assets/burgerImg/hamburguer_3.png',
      description: 'Burger KFC',
      price: 12.67),
  Hamburger(
      name: 'Hamburger Steak',
      img: 'assets/burgerImg/hamburguer_10.png',
      description: 'Small Burger',
      price: 12.67),
  Hamburger(
      name: 'Hamburger Barbecue',
      img: 'assets/burgerImg/hamburguer_5.png',
      description: 'Burger BQQ',
      price: 12.67),
  Hamburger(
      name: 'Hamburger Pizz',
      img: 'assets/burgerImg/hamburguer_4.png',
      description: 'Burger Pizz',
      price: 12.67),
  Hamburger(
      name: 'hambuerger flavors',
      img: 'assets/burgerImg/hamburguer_17.png',
      description: 'Chicken Cheese',
      price: 12.67)
];

final List<Product> products = [
  Product(
      name: 'Donats',
      img: 'assets/burgerImg/dunkan_2.png',
      color: const Color(0XFFFFF3E2),
      textColor: const Color.fromARGB(255, 249, 198, 127),
      items: 120),
  Product(
      name: 'Sushi',
      img: 'assets/burgerImg/sushi_2.png',
      color: const Color(0xFFF7D9DF),
      textColor: const Color.fromARGB(255, 250, 148, 170),
      items: 124),
  Product(
      name: 'Burgers',
      img: 'assets/burgerImg/hamburguer_5.png',
      color: const Color(0xFFFFEDD4),
      textColor: const Color.fromARGB(255, 249, 192, 117),
      items: 517),
  Product(
      name: 'Drinks',
      img: 'assets/burgerImg/drink.png',
      color: const Color(0xFFDCDDFF),
      textColor: const Color.fromARGB(255, 127, 132, 249),
      items: 80)
];

final List<Item> items = [
  Item(name: 'All', color: const Color(0XFF000000)),
  Item(name: 'Drink', color: const Color(0XFFDD81EA)),
  Item(name: 'Burger', color: const Color(0XFFF8A958)),
  Item(name: 'Donouts', color: const Color(0XFFD068D9)),
];

final List<Hamburger> order = [
  Hamburger(
      name: 'bacon cheeseburger',
      img: 'assets/burgerImg/hamburguer_5.png',
      description: 'Most Cheese Burger',
      price: 12.67),
  Hamburger(
      name: 'Hamburger French',
      img: 'assets/burgerImg/burger_1.png',
      description: 'Double Carn',
      price: 12.67),
];

final List<Ingredient> ingredients = [
  Ingredient(name: 'Meat', img: 'assets/burgerImg/meat.png', cal: 120),
  Ingredient(name: 'Cheese', img: 'assets/burgerImg/cheese.png', cal: 40),
  Ingredient(name: 'Tomato', img: 'assets/burgerImg/tomato.png', cal: 12),
  Ingredient(name: 'Green Leaf', img: 'assets/burgerImg/lettuse.png', cal: 22)
];
