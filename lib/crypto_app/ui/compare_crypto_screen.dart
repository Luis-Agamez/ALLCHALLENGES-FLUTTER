import 'package:app_one/crypto_app/domain/data/lauching_data.dart';
import 'package:app_one/crypto_app/ui/widgets/chart_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:ui' as ui;

import '../domain/bloc/bloc/coins_bloc.dart';
import '../domain/models/coins_response.dart';

class CompareCryptoScreen extends StatefulWidget {
  const CompareCryptoScreen({Key? key}) : super(key: key);

  @override
  State<CompareCryptoScreen> createState() => _CompareCryptoScreenState();
}

class _CompareCryptoScreenState extends State<CompareCryptoScreen> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF1C1C1E);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
            pinned: true,
            delegate: _PersistenHeaders(size.height * .55, indexSelected)),
        BlocBuilder<CoinsBloc, CoinsState>(
          builder: (context, state) {
            return state.isCoins
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: state.coins.length, (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            indexSelected = index;
                          });
                        },
                        child: CryptoCard(
                          size: size,
                          coin: state.coins[index],
                        ));
                  }))
                : const SizedBox();
          },
        )
      ]),
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
  late List<ChartDataPoint> chartDataTwo;

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
      chartData = normalizeData(hoursDataTwo[0]);
      chartDataTwo = normalizeData(hoursData[0]);
    });

    Path drawPathTwo(bool closePath) {
      final width = MediaQuery.of(context).size.width;
      final height = chartHeight;
      final segmentWiidth = width / (chartDataTwo.length - 1);
      final path = Path()..moveTo(0, height - chartDataTwo[0].value * height);

      for (var i = 0; i < chartDataTwo.length; i++) {
        final x = i * segmentWiidth;
        final y = height - (chartDataTwo[i].value * height);
        path.lineTo(x, y);
      }

      if (closePath) {
        path.lineTo(width, height);
        path.lineTo(0, height);
      }

      return path;
    }

    setState(() {
      chartData = normalizeData(hoursDataTwo[0]);
    });

    final size = MediaQuery.of(context).size;
    return Container(
      color: widget.backgroundColor,
      child: Stack(fit: StackFit.expand, children: [
        //------------------------------ HEADER ------------------------------ //
        Positioned(
            top: 30,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF26262A),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Cap',
                              style: TextStyle(
                                  fontFamily: 'BJBold',
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  '\$',
                                  style: TextStyle(
                                      fontFamily: 'BJBold',
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                                Text(
                                  '837B',
                                  style: TextStyle(
                                      fontFamily: 'BJBold',
                                      fontSize: 28,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '+0.93%',
                                  style: TextStyle(
                                      fontFamily: 'BJBold',
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      color: Colors.green),
                                ),
                              ],
                            )
                          ]),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(.2)),
                        child: Center(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
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
                const Divider(color: Colors.grey, height: 1)
              ],
            )),

        //------------------------------ GRAPHIC ------------------------------ //

        Positioned(
            top: size.height * .18,
            left: 0,
            right: 0,
            child: BlocBuilder<CoinsBloc, CoinsState>(
              builder: (context, state) {
                return Container(
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
                      Positioned(
                        bottom: 60,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            const Divider(height: 1, color: Colors.grey),
                            Text(
                              textAlign: TextAlign.center,
                              'BTC Dominance',
                              style: TextStyle(
                                  fontFamily: 'BJMedium',
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  color: const Color.fromARGB(255, 201, 147, 11)
                                      .withOpacity(0.85)),
                            ),
                            const Divider(height: 1, color: Colors.grey),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: const [
                            ChartDayLabels(
                              leftPadding: leftPadding,
                              rightPadding: rightPadding,
                            ),
                            Divider(height: 1, color: Colors.grey),
                          ],
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
                      ),
                      Positioned(
                        top: size.height * .05,
                        child: CustomPaint(
                          size: Size(
                              MediaQuery.of(context).size.width, chartHeight),
                          painter: PathPainterTwo(
                              path: drawPathTwo(false),
                              fillPath: drawPathTwo(true)),
                        ),
                      )
                    ]));
              },
            )),
      ]),
    );
  }
}

class PathPainter extends CustomPainter {
  final Path path;
  final Path fillPath;

  PathPainter({required this.path, required this.fillPath});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 240, 40, 22).withOpacity(0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawPath(path, paint);
    paint.style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(Offset.zero, Offset(0.0, size.height), [
      const Color.fromARGB(255, 95, 16, 10).withOpacity(0.85),
      const Color.fromARGB(255, 95, 27, 10).withOpacity(0.45),
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

class PathPainterTwo extends CustomPainter {
  final Path path;
  final Path fillPath;

  PathPainterTwo({required this.path, required this.fillPath});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 201, 147, 11).withOpacity(0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawPath(path, paint);
    paint.style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(Offset.zero, Offset(0.0, size.height), [
      Colors.transparent,
      Colors.transparent,
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

class _PersistenHeaders extends SliverPersistentHeaderDelegate {
  final double _maxHeight = 150;
  final double size;
  final int index;

  _PersistenHeaders(this.size, this.index);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = 1 - (shrinkOffset / _maxHeight).clamp(0.0, 1.0);
    return _PriceTab(
      backgroundColor: Color(0xFF1C1C1E),
      index: index,
    );
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class CryptoCard extends StatefulWidget {
  const CryptoCard({
    super.key,
    required this.size,
    required this.coin,
  });

  final Size size;
  final Coins coin;

  @override
  State<CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 95),
      curve: Curves.linear,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      width: widget.size.width * .8,
      height: widget.size.height * .125,
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
                          child: Image.network(widget.coin.image),
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
                            widget.coin.symbol.toUpperCase(),
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
                                    color:
                                        const Color.fromARGB(255, 20, 20, 22),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    '${widget.coin.marketCapRank}',
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
                                widget.coin.name,
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
                        '\$ ${widget.coin.currentPrice}',
                        style: const TextStyle(
                            fontFamily: 'BJMedium',
                            fontSize: 16,
                            letterSpacing: 1,
                            color: Colors.grey),
                      ),
                      Text(
                        '${widget.coin.priceChangePercentage24H}%',
                        style: TextStyle(
                            fontFamily: 'BJRegular',
                            fontSize: 14,
                            letterSpacing: 1,
                            color: widget.coin.priceChangePercentage24H < 0
                                ? Colors.red[900]
                                : Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
