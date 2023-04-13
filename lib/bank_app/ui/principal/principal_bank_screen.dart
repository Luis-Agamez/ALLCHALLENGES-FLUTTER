import 'package:app_one/bank_app/ui/constant.dart';
import 'package:app_one/bank_app/ui/principal/widgets/account_card.dart';
import 'package:flutter/material.dart';

import '../../domain/data/data.dart';
import '../../domain/models/account_transaction.dart';
import 'widgets/add_card_container.dart';
import 'widgets/header_home_page.dart';
import 'widgets/transaction_row.dart';

class PrincipalBankScreen extends StatefulWidget {
  const PrincipalBankScreen({super.key});

  @override
  State<PrincipalBankScreen> createState() => _PrincipalBankScreenState();
}

class _PrincipalBankScreenState extends State<PrincipalBankScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late PageController _pageController;
  late int _indexPage;
  late int _currentIndex;
  late bool _enableAddCreditCard;
  double _blueBgTranslatePercent = 1.0;
  double _blueBgTransitionPercent = 1.0;
  bool _hideByVelocity = false;

  //Data
  late AccountTransaction selectedLastTransaction;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .85, initialPage: 1)
      ..addListener(_pageListener);

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _indexPage = 1;
    _currentIndex = 1;
    _enableAddCreditCard = false;

    selectedLastTransaction = accountCards.first.lastTransaction;
    super.initState();
  }

  void _pageListener() {
    if (_pageController.page! > 1) {
      _blueBgTranslatePercent = _pageController.page!;
    } else {
      _blueBgTransitionPercent = _pageController.page!;
      _enableAddCreditCard = (_blueBgTransitionPercent < .1);
    }
    setState(() {});
  }

  void _onPageChange(int value) {
    _currentIndex = value;
    setState(() {
      _indexPage = (value == 0) ? 0 : value - 1;
      selectedLastTransaction = accountCards[_indexPage].lastTransaction;
    });
  }

  // Custom transition builder for the bottom AnimatedSwitch
  Widget _transitionBuilder(child, animation) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween(
          begin: Offset(0, 1),
          end: Offset(0, 0),
        ).animate(animation),
        child: child,
      ),
    );
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_currentIndex > 0) {
      if (details.primaryDelta! > 0.0) {
        _animationController.value += 0.004;
      } else {
        _animationController.value -= 0.004;
      }

      if (details.primaryDelta! > -1.5) {
        _hideByVelocity = false;
      } else {
        _hideByVelocity = true;
        _animationController.reverse();
      }
    }
    setState(() {});
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_currentIndex >= 0) {
      if (_animationController.value < 0.2 || _hideByVelocity) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorDark,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (_, __) {
            final value = _animationController.value;
            return GestureDetector(
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
              child: Container(
                color: Colors.transparent,
                child: Column(children: [
                  //-------------------------------------
                  // Header Home Page Widget
                  //-------------------------------------
                  Expanded(
                    flex: 4,
                    child: HeaderHomePage(
                      expandedFactor: 1 - value,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final widthBlueCard = constraints.maxWidth - 60;
                        final heightBlueCard = constraints.maxHeight - 40;

                        return Transform.translate(
                          offset:
                              Offset(0, (constraints.maxHeight * 2) * value),
                          child: Stack(
                            children: [
                              Transform.translate(
                                offset: Offset(
                                    -widthBlueCard *
                                        (_blueBgTranslatePercent - 1),
                                    0),
                                child: AddCardContainer(
                                  percent: _blueBgTransitionPercent,
                                  height: heightBlueCard,
                                  width: widthBlueCard,
                                  showItems: _enableAddCreditCard,
                                ),
                              ),
                              Transform(
                                transform: Matrix4.identity()
                                  ..translate(
                                      100.0 * (1 - _blueBgTransitionPercent)),
                                child: PageView.builder(
                                  onPageChanged: _onPageChange,
                                  itemCount: accountCards.length + 1,
                                  physics: const BouncingScrollPhysics(),
                                  controller: _pageController,
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return const SizedBox();
                                    } else {
                                      final account = accountCards[index - 1];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: AccountCard(account: account),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Transform.translate(
                        offset: Offset(0, (constraints.maxHeight * 4) * value),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                          child: Opacity(
                            opacity: _blueBgTransitionPercent,
                            child: AnimatedSwitcher(
                              duration: kThemeChangeDuration,
                              transitionBuilder: _transitionBuilder,
                              child: TransactionRow(
                                key: Key(_indexPage.toString()),
                                transaction: selectedLastTransaction,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
