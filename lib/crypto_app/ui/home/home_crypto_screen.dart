import 'dart:math';
import 'dart:ui' as ui;

import 'package:app_one/crypto_app/domain/data/lauching_data.dart';
import 'package:app_one/crypto_app/ui/widgets/chart_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/bloc/coins_bloc.dart';
import '../../domain/models/coins_response.dart';
import '../user/user_screen.dart';
import '../widgets/curved_navigation_bar.dart';

class HomeCryptoScreen extends StatefulWidget {
  const HomeCryptoScreen({Key? key}) : super(key: key);

  @override
  State<HomeCryptoScreen> createState() => _HomeCryptoScreenState();
}

class _HomeCryptoScreenState extends State<HomeCryptoScreen> {
  late CoinsBloc coinsBloc;

  @override
  void initState() {
    super.initState();
    coinsBloc = BlocProvider.of<CoinsBloc>(context);
    coinsBloc.getCoinsData();
  }

  final backgroundColor = Color(0xFF1C1C1E);
  bool _isDetails = false;
  int _indexSelected = 0;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int index = 0;

    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        backgroundColor: backgroundColor,
        body: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInExpo,
          tween: Tween(begin: 0, end: _isDetails ? 1 : 0),
          builder: (context, double value, child) {
            return Stack(children: [
              CustomScrollView(slivers: [
                SliverPersistentHeader(delegate: _PersistenHeaders()),
                SliverToBoxAdapter(
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My wallets',
                              style: TextStyle(
                                  fontFamily: 'BJBold',
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  color: Colors.white),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.add_circle_outline,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontFamily: 'BJRegular',
                                      fontSize: 18,
                                      letterSpacing: 1,
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                BlocBuilder<CoinsBloc, CoinsState>(
                  builder: (context, state) {
                    return SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.coins.length, (context, index) {
                      return GestureDetector(
                          onDoubleTap: () {
                            setState(() {
                              _indexSelected = index;
                              _isDetails = !_isDetails;
                            });

                            coinsBloc.getCoinData(state.coins[index].id);
                          },
                          child: state.isCoins
                              ? CryptoCard(
                                  size: size,
                                  imgUrl: state.coins[index].image,
                                  currentPrice: state.coins[index].currentPrice,
                                  simbol: state.coins[index].symbol)
                              : const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xFF26262A),
                                  ),
                                ));
                    }));
                  },
                )
              ]),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  top: _isDetails ? size.height * .052 : size.height * 1.2,
                  child: BlocBuilder<CoinsBloc, CoinsState>(
                    builder: (context, state) {
                      return state.isCoins
                          ? DefaultTabController(
                              length: 4,
                              child: Container(
                                width: size.width,
                                height: size.height * .99,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF26262A),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.coins[_indexSelected].symbol
                                              .toUpperCase(),
                                          style: const TextStyle(
                                              fontFamily: 'BJBold',
                                              fontSize: 32,
                                              letterSpacing: 1,
                                              color: Colors.white),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _isFavorite = !_isFavorite;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.star,
                                                  size: 36,
                                                  color: _isFavorite
                                                      ? Colors.yellow[900]
                                                      : Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white
                                                        .withOpacity(.2)),
                                                child: Center(
                                                    child: GestureDetector(
                                                  onTap: () => setState(() {
                                                    _isDetails = !_isDetails;
                                                  }),
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 26,
                                                  ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const TabBar(
                                        indicatorColor: Color(0xFF1E61E3),
                                        indicatorWeight: 3,
                                        isScrollable: true,
                                        tabs: [
                                          Tab(
                                            child: Text(
                                              'Price',
                                              style: TextStyle(
                                                  fontFamily: 'BJMedium',
                                                  fontSize: 16,
                                                  letterSpacing: 1,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              'information',
                                              style: TextStyle(
                                                  fontFamily: 'BJMedium',
                                                  fontSize: 16,
                                                  letterSpacing: 1,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              'Markets ',
                                              style: TextStyle(
                                                  fontFamily: 'BJMedium',
                                                  fontSize: 16,
                                                  letterSpacing: 1,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              'Analistycs',
                                              style: TextStyle(
                                                  fontFamily: 'BJMedium',
                                                  fontSize: 16,
                                                  letterSpacing: 1,
                                                  color: Colors.white),
                                            ),
                                          )
                                        ]),
                                    Expanded(
                                        child: TabBarView(children: [
                                      _PriceTab(
                                        backgroundColor: backgroundColor,
                                        index: _indexSelected,
                                      ),
                                      _InformationTab(
                                          backgroundColor: backgroundColor),
                                      Container(color: backgroundColor),
                                      Container(color: backgroundColor)
                                    ]))
                                  ]),
                                ),
                              ),
                            )
                          : const SizedBox();
                    },
                  ))
            ]);
          },
        ),
        bottomNavigationBar: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 900),
          tween: Tween(begin: 1, end: _isDetails ? 0 : 1),
          curve: Curves.linear,
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: CurvedNavigationBar(
                onTap: _isDetails
                    ? null
                    : (val) => setState(() {
                          index = val;
                        }),
                currentIndex: index,
                items: const [
                  CurvedNavigationBarItem(iconData: Icons.home),
                  CurvedNavigationBarItem(
                      iconData: Icons.stacked_line_chart_outlined),
                  CurvedNavigationBarItem(
                      iconData: Icons.home_repair_service_rounded),
                  CurvedNavigationBarItem(iconData: Icons.build_circle_rounded),
                ],
              ),
            );
          },
        ));
  }
}

class _InformationTab extends StatelessWidget {
  const _InformationTab({
    super.key,
    required this.backgroundColor,
  });

  final ui.Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinsBloc, CoinsState>(
      builder: (context, state) {
        return state.isDataCoin
            ? Container(
                color: backgroundColor,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.zero,
                                  width: 50,
                                  height: 50,
                                  child:
                                      Image.network(state.coin[0].image.large),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.coin[0].symbol.toUpperCase(),
                                    style: const TextStyle(
                                        fontFamily: 'BJMedium',
                                        fontSize: 18,
                                        letterSpacing: 1,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 20, 20, 22),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            '${state.coin[0].marketCapRank}',
                                            style: const TextStyle(
                                                fontFamily: 'BJMedium',
                                                fontSize: 14,
                                                letterSpacing: 1,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        state.coin[0].name,
                                        style: const TextStyle(
                                            fontFamily: 'BJRegular',
                                            fontSize: 16,
                                            letterSpacing: 1,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '\$ ${state.coin[0].marketData.currentPrice['usd']}',
                                style: const TextStyle(
                                    fontFamily: 'BJMedium',
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: Colors.grey),
                              ),
                              Text(
                                '${state.coin[0].marketData.priceChangePercentage24H}%',
                                style: TextStyle(
                                    fontFamily: 'BJRegular',
                                    fontSize: 14,
                                    letterSpacing: 1,
                                    color: state.coin[0].marketData
                                                .priceChangePercentage7D <
                                            0
                                        ? Colors.red[900]
                                        : Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        state.coin[0].description.en,
                        style: const TextStyle(
                            fontFamily: 'BJRegular',
                            fontSize: 18,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
                    ]),
                  ),
                ))
            : SizedBox();
      },
    );
  }
}

class _PriceTab extends StatefulWidget {
  const _PriceTab({
    super.key,
    required this.backgroundColor,
    required this.index,
  });

  final Color backgroundColor;
  final int index;

  @override
  State<_PriceTab> createState() => _PriceTabState();
}

class _PriceTabState extends State<_PriceTab> {
  late List<ChartDataPoint> chartData;
  @override
  Widget build(BuildContext context) {
    @override
    const leftPadding = 60.0;
    const rightPadding = 60.0;
    double chartHeight = 240;

    List<ChartDataPoint> normalizeData(WeekData weekData) {
      final maxDay = weekData.days.reduce((DayData dayA, DayData dayB) {
        return dayA.laughs > dayB.laughs ? dayA : dayB;
      });

      final normalizedList = <ChartDataPoint>[];

      weekData.days.forEach((element) {
        normalizedList.add(ChartDataPoint(
            value: maxDay.laughs == 0 ? 0 : element.laughs / maxDay.laughs));
      });

      normalizedList.forEach((element) => print(element.value));

      return normalizedList;
    }

    Path drawPath(bool closePath) {
      final width = MediaQuery.of(context).size.width;
      final height = chartHeight;
      final segmentWiidth = width / (chartData.length - 1);
      final path = Path()..moveTo(0, height - chartData[0].value * height);

      for (var i = 0; i < chartData.length; i++) {
        final x = i * segmentWiidth;
        final y = height - (chartData[i].value * height);
        path.lineTo(x, y);
      }

      if (closePath) {
        path.lineTo(width, height);
        path.lineTo(0, height);
      }

      return path;
    }

    setState(() {
      chartData = normalizeData(hoursData[0]);
    });

    final size = MediaQuery.of(context).size;
    return BlocBuilder<CoinsBloc, CoinsState>(
      builder: (context, state) {
        return Container(
          color: widget.backgroundColor,
          child: Stack(children: [
            //------------------------------ HEADER ------------------------------ //
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFF26262A),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.zero,
                                        width: 30,
                                        height: 30,
                                        child: Image.network(
                                            state.coins[widget.index].image),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      state.coins[widget.index].name,
                                      style: const TextStyle(
                                          fontFamily: 'BJBold',
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '\$',
                                      style: TextStyle(
                                          fontFamily: 'BJBold',
                                          fontSize: 16,
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${state.coins[widget.index].currentPrice}',
                                      style: const TextStyle(
                                          fontFamily: 'BJBold',
                                          fontSize: 28,
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '${state.coins[widget.index].priceChangePercentage24H}',
                                      style: TextStyle(
                                          fontFamily: 'BJBold',
                                          fontSize: 16,
                                          letterSpacing: 1,
                                          color: state.coins[widget.index]
                                                      .priceChangePercentage24H <
                                                  0
                                              ? Colors.red[900]
                                              : Colors.green),
                                    ),
                                  ],
                                )
                              ]),
                          Text(
                            '${state.coins[widget.index].marketCapRank}',
                            style: const TextStyle(
                                fontFamily: 'BJBold',
                                fontSize: 28,
                                letterSpacing: 1,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey, height: 1)
                  ],
                )),

            //------------------------------ GRAPHIC ------------------------------ //

            Positioned(
                top: size.height * .12,
                left: 0,
                right: 0,
                child: Container(
                    width: size.width,
                    height: size.height * .38,
                    child: Stack(children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.red[600]),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Low : ',
                                        style: TextStyle(
                                            fontFamily: 'BJMedium',
                                            fontSize: 18,
                                            letterSpacing: 1,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        '${state.coins[widget.index].low24H}',
                                        style: const TextStyle(
                                            fontFamily: 'BJBold',
                                            fontSize: 20,
                                            letterSpacing: 1,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.green[500]),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'High : ',
                                          style: TextStyle(
                                              fontFamily: 'BJMedium',
                                              fontSize: 18,
                                              letterSpacing: 1,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          '${state.coins[widget.index].high24H}',
                                          style: const TextStyle(
                                              fontFamily: 'BJBold',
                                              fontSize: 20,
                                              letterSpacing: 1,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(
                                height: 1,
                                color: Colors.grey,
                              )
                            ],
                          )),
                      const Positioned(
                        bottom: 50,
                        left: 0,
                        right: 0,
                        child: ChartDayLabels(
                          leftPadding: leftPadding,
                          rightPadding: rightPadding,
                        ),
                      ),
                      Positioned(
                        top: size.height * .05,
                        child: CustomPaint(
                          size: Size(
                              MediaQuery.of(context).size.width, chartHeight),
                          painter: PathPainter(
                              path: drawPath(false), fillPath: drawPath(true)),
                        ),
                      )
                    ]))),

            Positioned(
                top: size.height * .45,
                left: 0,
                right: 0,
                child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: Column(
                      children: [
                        _RowItem(
                          text:
                              '${state.coins[widget.index].marketCap.toInt()}B \$',
                          child: Row(
                            children: [
                              const Text(
                                'Market Cap',
                                style: TextStyle(
                                    fontFamily: 'BJRegular',
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    color: Colors.grey),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF26262A),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    '${state.coins[widget.index].marketCapRank}',
                                    style: const TextStyle(
                                        fontFamily: 'BJRegular',
                                        fontSize: 14,
                                        letterSpacing: 1,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        _RowItem(
                          text: '${state.coins[widget.index].maxSupply}M BTC',
                          child: const Text(
                            'Total Supply',
                            style: TextStyle(
                                fontFamily: 'BJRegular',
                                fontSize: 18,
                                letterSpacing: 1,
                                color: Colors.grey),
                          ),
                        ),
                        _RowItem(
                          text:
                              '${state.coins[widget.index].circulatingSupply.toInt()}M BTC',
                          child: const Text(
                            'In Circulation',
                            style: TextStyle(
                                fontFamily: 'BJRegular',
                                fontSize: 18,
                                letterSpacing: 1,
                                color: Colors.grey),
                          ),
                        ),
                        _RowItem(
                          text: '${state.coins[widget.index].ath} \$',
                          child: const Text(
                            'Trading Volume',
                            style: TextStyle(
                                fontFamily: 'BJRegular',
                                fontSize: 18,
                                letterSpacing: 1,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ))),

            Positioned(
                bottom: size.height * .05,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(children: [
                    Container(
                      width: size.width * .41,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color(0xFF26262A),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              topLeft: Radius.circular(25))),
                      child: const Center(
                        child: Text(
                          '- Sell',
                          style: TextStyle(
                              fontFamily: 'BJMedium',
                              fontSize: 20,
                              letterSpacing: 1,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                        width: size.width * .41,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xFF1E61E3),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: const Center(
                          child: Text(
                            '+ Buy',
                            style: TextStyle(
                                fontFamily: 'BJMedium',
                                fontSize: 20,
                                letterSpacing: 1,
                                color: Colors.white),
                          ),
                        ))
                  ]),
                ))
          ]),
        );
      },
    );
  }
}

class _RowItem extends StatelessWidget {
  final Widget child;
  final String text;
  const _RowItem({
    super.key,
    required this.child,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            child,
            Text(
              text,
              style: const TextStyle(
                  fontFamily: 'BJBold',
                  fontSize: 20,
                  letterSpacing: 1,
                  color: Colors.white),
            ),
          ],
        ),
        Divider(color: Colors.grey.withOpacity(.4))
      ],
    );
  }
}

class CryptoCard extends StatefulWidget {
  const CryptoCard({
    super.key,
    required this.size,
    required this.imgUrl,
    required this.simbol,
    required this.currentPrice,
  });

  final Size size;

  final String imgUrl;
  final String simbol;
  final double currentPrice;

  @override
  State<CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  bool _isSelected = false;
  bool _isExpand = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });

        Future.delayed(
            const Duration(milliseconds: 300),
            () => setState(() {
                  _isExpand = !_isExpand;
                }));
      },
      // borderRadius: BorderRadius.circular(15),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 95),
        curve: Curves.linear,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
        width: widget.size.width * .8,
        height:
            _isSelected ? widget.size.height * .25 : widget.size.height * .125,
        decoration: BoxDecoration(
            color: const Color(0xFF26262A),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.zero,
                            width: 50,
                            height: 50,
                            child: Image.network(widget.imgUrl),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.simbol.toUpperCase(),
                              style: const TextStyle(
                                  fontFamily: 'BJMedium',
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  color: Colors.white),
                            ),
                            Text(
                              '\$ ${widget.currentPrice}',
                              style: const TextStyle(
                                  fontFamily: 'BJRegular',
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      '\$356.234.67',
                      style: TextStyle(
                          fontFamily: 'BJMedium',
                          fontSize: 26,
                          letterSpacing: 1,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            _isSelected
                ? TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: _isSelected ? 1 : 0),
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.fastLinearToSlowEaseIn,
                    builder: (context, double value, child) {
                      return Opacity(
                        opacity: value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Divider(color: Colors.grey, height: 1 * value),
                            SizedBox(height: 20 * value),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 50 * value,
                                    height: 50 * value,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25 * value),
                                        color: Colors.white.withOpacity(.3)),
                                    child: Center(
                                        child: Icon(
                                      Icons.crisis_alert_outlined,
                                      size: 25 * value,
                                      color: Colors.white,
                                    )),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 50 * value,
                                        width: 120 * value,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10 * value),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF414049),
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(25 * value),
                                                bottomLeft: Radius.circular(
                                                    25 * value))),
                                        child: Row(
                                          children: [
                                            Icon(Icons.remove,
                                                size: 16 * value,
                                                color: Colors.white),
                                            Text(
                                              ' Send',
                                              style: TextStyle(
                                                  fontFamily: 'BJRegular',
                                                  fontSize: 14 * value,
                                                  letterSpacing: 1 * value,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10 * value,
                                      ),
                                      Container(
                                        height: 50 * value,
                                        width: 120 * value,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10 * value),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF1E61E3),
                                            borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(25 * value),
                                                bottomRight: Radius.circular(
                                                    25 * value))),
                                        child: Row(
                                          children: [
                                            Icon(Icons.add,
                                                size: 16 * value,
                                                color: Colors.white),
                                            Text(
                                              ' Receive',
                                              style: TextStyle(
                                                  fontFamily: 'BJRegular',
                                                  fontSize: 14 * value,
                                                  letterSpacing: 1 * value,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ])
                          ],
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class _PersistenHeaders extends SliverPersistentHeaderDelegate {
  final double _maxHeight = 150;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = 1 - (shrinkOffset / _maxHeight).clamp(0.0, 1.0);
    print(percent);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: Color(0xFF26262A),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            size: 32 * percent,
            color: Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'TOTAL BALANCE',
                style: TextStyle(
                    fontFamily: 'BJRegular',
                    fontSize: 15 * percent,
                    letterSpacing: 1,
                    color: Colors.grey),
              ),
              Text(
                '\$ 278,456.56',
                style: TextStyle(
                    fontFamily: 'BJRegular',
                    fontSize: 32 * percent,
                    letterSpacing: 1,
                    color: Colors.white),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 600),
                  pageBuilder: (_, animation, __) {
                    return FadeTransition(
                        opacity: animation, child: const UserScreen());
                  },
                ),
              );
            },
            child: Container(
              width: 50 * percent,
              height: 50 * percent,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white, width: 2)),
              child: CircleAvatar(
                radius: 25,
                child: Image.asset('assets/cryptoImg/user_4.png'),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxHeight;

  @override
  double get minExtent => _maxHeight - 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class PathPainter extends CustomPainter {
  final Path path;
  final Path fillPath;

  PathPainter({required this.path, required this.fillPath});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const ui.Color.fromARGB(255, 73, 203, 13).withOpacity(0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
    canvas.drawPath(path, paint);
    paint.style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(Offset.zero, Offset(0.0, size.height), [
      const ui.Color.fromARGB(255, 37, 95, 10).withOpacity(0.85),
      const ui.Color.fromARGB(255, 37, 95, 10).withOpacity(0.45),
      Colors.transparent,
    ], [
      0.2,
      0.35,
      0.7,
    ]);

    canvas.drawPath(fillPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ChartDataPoint {
  final double value;

  ChartDataPoint({required this.value});
}
