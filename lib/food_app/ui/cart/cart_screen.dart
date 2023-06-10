import 'dart:math';

import 'package:flutter/material.dart';

import '../../domain/entities/pizza.dart';

class CartScreen extends StatelessWidget {
  final Pizza pizza;
  const CartScreen({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFF),
      body: Stack(children: [
        Positioned(
            top: 50,
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'My Order',
                  style: TextStyle(
                      fontFamily: 'PMedium', color: Colors.black, fontSize: 20),
                ),
                SizedBox(width: 10)
              ],
            )),
        Positioned(
          top: 100,
          left: 15,
          right: 15,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            OrderCard(pizza: pizza),
            OrderCard(pizza: pizza),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Subtotal',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'PRegular',
                                fontSize: 16)),
                        Text('18.00',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'PRegular',
                                fontSize: 16))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Add Ingredients',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'PRegular',
                                fontSize: 16)),
                        Text('8.00',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'PRegular',
                                fontSize: 16))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Delivery Freee',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'PRegular',
                                fontSize: 16)),
                        Text('2.00',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'PRegular',
                                fontSize: 16))
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Total',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'PMedium',
                                fontSize: 20)),
                        Text('20.00',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'PMedium',
                                fontSize: 22))
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('Your Delivery Address',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'PRegular',
                                      fontSize: 16)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add_location_rounded),
                                  Text('94311 Meagen Inllet Suite 386',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'PMedium',
                                          fontSize: 18)),
                                ],
                              )
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios,
                              size: 32, color: Colors.grey)
                        ],
                      ),
                      const Divider(color: Colors.grey),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Payment method',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'PRegular',
                                  fontSize: 16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add_card_rounded,
                                      color: Colors.grey, size: 18),
                                  SizedBox(width: 5),
                                  Text('Cash',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'PMedium',
                                          fontSize: 18)),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  size: 32, color: Colors.grey)
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            )
          ]),
        ),
        Positioned(
            bottom: 40,
            left: 30,
            right: 30,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xFF121A2C)),
              child: Center(
                child: Text('Place Order',
                    style: TextStyle(
                        color: Colors.yellow[800],
                        fontFamily: 'PRegular',
                        fontSize: 18)),
              ),
            ))
      ]),
    );
  }
}

class OrderCard extends StatefulWidget {
  final Pizza pizza;
  const OrderCard({super.key, required this.pizza});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _animationController.forward();
    super.initState();
  }

  int count = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Card(
          child: Container(
              width: size.width * .85,
              height: size.height * .12,
              margin: const EdgeInsets.only(bottom: 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: const BoxDecoration(),
                  )),
                  Positioned(
                      left: -25,
                      top: 12,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..scale(_animationController.value)
                          ..rotateZ(_animationController.value * pi),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.zero,
                            width: 100,
                            height: 100,
                            child: Image.asset(widget.pizza.image),
                          ),
                        ),
                      )),
                  Positioned(
                      left: size.width * .2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.pizza.name,
                            style: const TextStyle(
                                fontFamily: 'PBold',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          Container(
                            width: size.width * .9,
                            height: size.height * .05,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Add : ',
                                  style: TextStyle(
                                      fontFamily: 'PRegular',
                                      fontSize: 14,
                                      color: Colors.grey),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.pizza.ingredients.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 4),
                                      child: Text(
                                        widget.pizza.ingredients[index],
                                        style: const TextStyle(
                                            fontFamily: 'PRegular',
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      bottom: 0,
                      left: size.width * .3,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\$',
                                style: TextStyle(
                                    fontFamily: 'PBold',
                                    fontSize: 14,
                                    color: Colors.yellow[800]),
                              ),
                              Text(
                                '${widget.pizza.price}',
                                style: const TextStyle(
                                    fontFamily: 'PBold',
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFFAFCFE),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 16,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      count--;
                                    });
                                  },
                                ),
                                Text(count.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[800],
                                        fontFamily: 'PMedium')),
                                IconButton(
                                  icon: const Icon(Icons.add, size: 16),
                                  onPressed: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              )),
        );
      },
    );
  }
}
