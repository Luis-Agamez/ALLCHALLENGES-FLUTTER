import 'dart:math';

import 'package:app_one/bank_app/domain/data/data.dart';
import 'package:app_one/bank_app/ui/details/details_screen.dart';
import 'package:app_one/bank_app/ui/home/widgets/card_transaction.dart';
import 'package:app_one/bank_app/ui/home/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import '../../domain/models/card.dart';
import '../constant.dart';
import '../details/widgets/card.dart';
import '../principal/principal_bank_screen.dart';
import 'widgets/circle_avatar.dart';

class BankHomeScreen extends StatefulWidget {
  const BankHomeScreen({super.key});

  @override
  State<BankHomeScreen> createState() => _BankHomeScreenState();
}

class _BankHomeScreenState extends State<BankHomeScreen>
    with TickerProviderStateMixin {
  bool _selectedMode = false;
  late AnimationController _animationController;
  late AnimationController _animationMovement;
  int indexSelect = 0;
  Future<void> _onCardSelected(CardData card, index) async {
    const duration = Duration(milliseconds: 1200);

    if (indexSelect != index) return;
    _animationMovement.forward();

    await Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: DetailsScreen(card: card),
      ),
    ));

    _animationMovement.reverse(from: 1.0);
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0.15,
        upperBound: 0.55,
        duration: const Duration(milliseconds: 500));

    _animationMovement = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 880));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationMovement.dispose();
    super.dispose();
  }

  int _getCurrentFactor(int currentIndex) {
    if (currentIndex == indexSelect) {
      return 0;
    } else if (indexSelect == 0) {
      return 1;
    } else if (currentIndex > indexSelect) {
      return -1;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    // double value = 0.15;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColorLigth,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: backgroundColorDark,
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              height: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Avatar(size: 50),
                  const Text('Card management',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'PMedium',
                          letterSpacing: 1)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 600),
                          pageBuilder: (_, animation, __) {
                            return FadeTransition(
                                opacity: animation,
                                child: const PrincipalBankScreen());
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: backgroundColorDark,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 1)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height * .68,
              decoration: BoxDecoration(
                  color: backgroundColorDark,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(size.width * .15),
                      bottomRight: Radius.circular(size.width * .15))),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                      right: 20,
                      left: 20,
                      top: 40,
                      bottom: 90,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return GestureDetector(
                                onLongPress: () {
                                  if (!_selectedMode) {
                                    _animationController
                                        .forward()
                                        .whenComplete(() {
                                      setState(() {
                                        _selectedMode = true;
                                      });
                                    });
                                  } else {
                                    _animationController
                                        .reverse()
                                        .whenComplete(() {
                                      setState(() {
                                        _selectedMode = false;
                                      });
                                    });
                                  }
                                },
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateX(_animationController.value),
                                  child: Container(
                                    margin: EdgeInsets.zero,
                                    child: AbsorbPointer(
                                      absorbing: !_selectedMode,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        clipBehavior: Clip.none,
                                        children: [
                                          ...List.generate(
                                              cards.length,
                                              (index) => Card3DItem(
                                                    _animationMovement,
                                                    isMode: _selectedMode,
                                                    indexSelected: indexSelect,
                                                    verticalFactor:
                                                        _getCurrentFactor(
                                                            index),
                                                    onCardSelected: (card) {
                                                      _onCardSelected(
                                                          card, index);
                                                    },
                                                    card: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          indexSelect = index;
                                                        });
                                                      },
                                                      child: CardItem(
                                                          card: cards[index]),
                                                    ),
                                                    percent:
                                                        _animationController
                                                            .value,
                                                    depth: index,
                                                    height:
                                                        constraints.maxHeight /
                                                            2,
                                                  )).reversed.toList()
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      )),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          IconButtom(
                              reverse: false,
                              label: 'Swap',
                              icon: Icon(
                                Icons.compare_arrows_outlined,
                                color: Colors.white,
                              )),
                          IconButtom(
                              reverse: false,
                              label: 'Freeze',
                              icon: Icon(
                                Icons.lock_outlined,
                                color: Colors.white,
                              )),
                          IconButtom(
                              reverse: false,
                              label: 'Send',
                              icon: Icon(
                                Icons.arrow_outward_outlined,
                                color: Colors.white,
                              )),
                          IconButtom(
                              reverse: true,
                              label: 'Receive',
                              icon: Icon(
                                Icons.arrow_outward_outlined,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * .04,
                    left: 20,
                    right: 20,
                    child: Container(
                      margin: EdgeInsets.zero,
                      height: size.height * .15,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: _selectedMode ? 0 : 1),
                        duration: const Duration(milliseconds: 400),
                        builder: (context, double value, child) {
                          return Opacity(
                            opacity: value,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'Hello: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 36,
                                          fontFamily: 'GRegular',
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      'Luis Agamez',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontFamily: 'CRegular',
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      'Total: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 36,
                                          fontFamily: 'CRegular',
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      '\$6742324768.0',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontFamily: 'CRegular',
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              child: const Text(
                'Transactions',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontFamily: 'PMedium',
                    fontSize: 24),
              ),
            ),
            Container(
                margin: EdgeInsets.zero,
                height: 90,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(
                          transactions.length,
                          (index) => CardTrasaction(
                                transaction: transactions[index],
                              ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class Card3DItem extends AnimatedWidget {
  const Card3DItem(
    this.animation, {
    super.key,
    required this.card,
    required this.percent,
    required this.height,
    required this.depth,
    required this.onCardSelected,
    required this.indexSelected,
    required this.isMode,
    required this.verticalFactor,
  }) : super(listenable: animation);
  final Widget card;
  final double percent;
  final int indexSelected;
  final double height;
  final bool isMode;
  final int verticalFactor;
  final Animation<double> animation;

  final int depth;
  final ValueChanged<CardData> onCardSelected;

  Animation<double> get animate => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    double depthFactor = 50.0;
    final bottomMargin = height / 12 * 0;
    final double top =
        height + (-depth / 1.5) * height * percent - bottomMargin;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      left: 0,
      right: 0,
      top: isMode && indexSelected == depth ? top + -40 : top,
      child: Opacity(
        opacity: verticalFactor == 0 ? 1 : 1 - animation.value,
        child: Hero(
          tag: cards[depth].bankName,
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            Widget current;
            if (flightDirection == HeroFlightDirection.push) {
              current = toHeroContext.widget;
            } else {
              current = fromHeroContext.widget;
            }

            return AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                return Transform(
                  alignment: Alignment.center,
                  key: key,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX((2 * pi) * animation.value),
                  child: current,
                );
              },
            );
          },
          child: Transform(
              alignment: Alignment.center,
              key: key,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                //  ..translate(0.0, 0.0, depth * depthFactor),
                ..translate(
                    0.0,
                    verticalFactor *
                        animation.value *
                        MediaQuery.of(context).size.height,
                    depth * depthFactor),
              child: GestureDetector(
                  onDoubleTap: () {
                    onCardSelected(cards[depth]);
                  },
                  child: Container(child: card))),
        ),
      ),
    );
  }
}
