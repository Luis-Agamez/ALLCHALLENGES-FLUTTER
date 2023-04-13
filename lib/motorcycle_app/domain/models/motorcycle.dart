import 'package:flutter/material.dart';

class Motorcycle {
  final String name;
  final String maker;
  final int price;
  final double qualification;
  final String image;
  final int weight;
  final int speed;
  final int engine;
  final String description;
  final List<String> images;
  final String makerImg;
  final List<Color> colors;
  final int year;

  Motorcycle({
    required this.name,
    required this.maker,
    required this.price,
    required this.qualification,
    required this.image,
    required this.images,
    required this.makerImg,
    required this.year,
    required this.weight,
    required this.speed,
    required this.engine,
    required this.description,
    required this.colors,
  });
}

final deluxe = [
  Motorcycle(
      name: 'NINJA 1000',
      maker: 'KAWASAKI',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m1.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/kawasaki.png',
      description:
          'Being the firts is the main goal of the new NINJA 300 Fireblade',
      images: [
        'assets/imgM/ninja_1000.png',
      ],
      colors: const [
        Color.fromARGB(255, 3, 5, 7),
      ]),
  Motorcycle(
      name: 'NINJA 650',
      maker: 'KAWASAKI',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m1.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/kawasaki.png',
      description:
          'Being the firts is the main goal of the new NINJA 300 Fireblade',
      images: [
        'assets/imgM/ninja_650_1.png',
        'assets/imgM/ninja_650_2.png',
        'assets/imgM/ninja_650_3.png'
      ],
      colors: const [
        Color.fromARGB(255, 9, 97, 185),
        Color.fromARGB(255, 135, 234, 7),
        Color.fromARGB(255, 255, 255, 255)
      ]),
  Motorcycle(
      name: 'NINJA 10R',
      maker: 'KAWASAKI',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m1.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/kawasaki.png',
      description:
          'Being the firts is the main goal of the new NINJA 300 Fireblade',
      images: [
        'assets/imgM/ninja_zx_10r_1.png',
        'assets/imgM/ninja_zx_10r_2.png'
      ],
      colors: const [
        Color.fromARGB(255, 119, 238, 40),
        Color.fromARGB(255, 1, 8, 15),
      ]),
  Motorcycle(
      name: 'CBR1000',
      maker: 'HONDA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m2.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/honda.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: [
        'assets/imgM/cbr_1000_1.png',
        'assets/imgM/cbr_1000_2.png'
      ],
      colors: const [
        Color.fromARGB(255, 139, 3, 3),
        Color.fromARGB(255, 224, 227, 230)
      ]),
  Motorcycle(
      name: 'YZF R15',
      maker: 'YAMAHA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m4.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/yamaha.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: [
        'assets/imgM/yzf_r15_1.png',
        'assets/imgM/yzf_r15_2.png',
        'assets/imgM/yzf_r15_3.png'
      ],
      colors: const [
        Color.fromARGB(255, 113, 114, 116),
        Color.fromARGB(255, 32, 3, 197),
        Color.fromARGB(255, 16, 16, 17)
      ]),
  Motorcycle(
      name: 'YZF R6',
      maker: 'YAMAHA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m9.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/yamaha.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: [
        'assets/imgM/yzf_r6_1.png',
        'assets/imgM/yzf_r6_2.png',
        'assets/imgM/yzf_r6_3.png'
      ],
      colors: const [
        Color.fromARGB(255, 32, 17, 243),
        Color.fromARGB(255, 9, 10, 10)
      ]),
  Motorcycle(
      name: 'YZF R3',
      maker: 'YAMAHA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m12.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/yamaha.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: [
        'assets/imgM/yzf_r3_1.png',
        'assets/imgM/yzf_r3_2.png',
      ],
      colors: const [
        Color.fromARGB(255, 22, 130, 238),
        Color.fromARGB(255, 8, 9, 10)
      ]),
  Motorcycle(
      name: 'YZF R1',
      maker: 'HONDA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m8.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/honda.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: [
        'assets/imgM/yzf_r1_1.png',
        'assets/imgM/yzf_r1_2.png',
        'assets/imgM/yzf_r1_3.png',
      ],
      colors: const [
        Color.fromARGB(244, 6, 37, 214),
        Color.fromARGB(255, 189, 31, 31),
        Color.fromARGB(255, 3, 161, 153)
      ]),
];

final medium = [
  Motorcycle(
      name: 'NINJA Z1000',
      maker: 'KAWASAKI',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/z_1000_1.png',
      year: 2021,
      weight: 180,
      speed: 280,
      engine: 125,
      makerImg: 'assets/imgM/kawasaki.png',
      description:
          'Being the firts is the main goal of the new NINJA 300 Fireblade',
      images: [
        'assets/imgM/z_1000_1.png',
        'assets/imgM/z_1000_2.png'
      ],
      colors: const [
        Color.fromARGB(255, 8, 10, 11),
        Color.fromARGB(255, 60, 152, 7)
      ]),
  Motorcycle(
      name: 'XRE 150',
      maker: 'HONDA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/xre_150.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/honda.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: ['assets/imgM/xre_150.png'],
      colors: const [Color.fromARGB(255, 176, 6, 23)]),
  Motorcycle(
      name: 'DEROX',
      maker: 'YAMAHA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m10.png',
      year: 2021,
      weight: 180,
      speed: 280,
      engine: 125,
      makerImg: 'assets/imgM/yamaha.png',
      description:
          'Being the firts is the main goal of the new NINJA 300 Fireblade',
      images: ['assets/imgM/m10.png'],
      colors: const [Color.fromARGB(255, 247, 254, 51)]),
  Motorcycle(
      name: 'CBR 150',
      maker: 'HONDA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/cbr_150_1.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/honda.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: [
        'assets/imgM/cbr_150_1.png',
        'assets/imgM/cbr_150_2.png'
      ],
      colors: const [
        Color.fromARGB(255, 196, 22, 6),
        Color.fromARGB(255, 255, 255, 255)
      ]),
  Motorcycle(
      name: 'DIO',
      maker: 'HONDA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/dio_1.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/honda.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: ['assets/imgM/dio_1.png'],
      colors: const [Color.fromARGB(255, 242, 50, 50)]),
  Motorcycle(
      name: 'CRF150F',
      maker: 'HONDA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m5.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/honda.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: ['assets/imgM/m5.png'],
      colors: const [Color.fromARGB(255, 196, 11, 11)]),
  Motorcycle(
      name: 'VAR10',
      maker: 'YAMAHA',
      price: 120,
      qualification: 4.8,
      image: 'assets/imgM/m3.png',
      year: 2021,
      weight: 210,
      speed: 280,
      engine: 492,
      makerImg: 'assets/imgM/yamaha.png',
      description:
          'Being the firts is the main goal of the new CBR1000RR-R Fireblade',
      images: ['assets/imgM/m3.png'],
      colors: const [Color(0xFF192129)]),
];
