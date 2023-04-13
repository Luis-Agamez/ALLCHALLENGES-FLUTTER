import 'package:flutter/material.dart';

import '../data/laughing_data.dart';

class ChartDayLabels extends StatelessWidget {
  const ChartDayLabels(
      {Key? key, required this.leftPadding, required this.rightPadding})
      : super(key: key);

  final double leftPadding;
  final double rightPadding;

  Offset labelOffset(int length, double i) {
    final segment = 1 / (length - 1);
    final offsetValue = (i - ((length - 1) / 2)) * segment;
    return Offset(offsetValue, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 1.0],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 62, 5, 218),
            Color.fromARGB(255, 62, 5, 218).withOpacity(0.85)
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['3:0', '6:0', '9:0', '12:0', '15:0', '18:0', '21:0']
              .asMap()
              .entries
              .map(
                (entry) => FractionalTranslation(
                  translation: labelOffset(7, entry.key.toDouble()),
                  child: SizedBox(
                    width: 36,
                    child: Text(
                      entry.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class ChartLaughLabels extends StatelessWidget {
  const ChartLaughLabels({
    Key? key,
    required this.chartHeight,
    required this.topPadding,
    required this.leftPadding,
    required this.rightPadding,
    required this.weekData,
  }) : super(key: key);

  final double chartHeight;
  final double topPadding;
  final double leftPadding;
  final double rightPadding;
  final WeekData weekData;

  @override
  Widget build(BuildContext context) {
    const labelCount = 6;
    final maxDay = weekData.days.reduce((DayData a, DayData b) {
      return a.laughs > b.laughs ? a : b;
    });
    final rowHeight = (chartHeight) / labelCount;

    final labels = <double>[];
    for (var i = 0; i < labelCount; i++) {
      labels.add(maxDay.laughs.toDouble() -
          (i * maxDay.laughs.toDouble() / (labelCount - 1)));
    }

    Offset labelOffset(int length, double i) {
      final segment = 1 / (length - 1);
      final offsetValue = (i - ((length - 1) / 2)) * segment;
      return Offset(0, offsetValue);
    }

    return Container(
      height: chartHeight + topPadding,
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: labels
            .asMap()
            .entries
            .map(
              (entry) => FractionalTranslation(
                translation: labelOffset(labelCount, entry.key.toDouble()),
                child: Container(
                  height: rowHeight,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                        width: leftPadding,
                        child: Text(
                          entry.value.toStringAsFixed(1),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ),
                      SizedBox(width: rightPadding),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
