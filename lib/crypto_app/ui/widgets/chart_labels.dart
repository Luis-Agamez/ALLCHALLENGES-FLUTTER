import 'package:flutter/material.dart';

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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 1.0],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.transparent,
            Colors.transparent,
          ],
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: leftPadding / 2, right: rightPadding / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['12', '17', '22', '3', '8']
              .asMap()
              .entries
              .map(
                (entry) => FractionalTranslation(
                  translation: labelOffset(5, entry.key.toDouble()),
                  child: SizedBox(
                    width: 36,
                    child: Text(
                      entry.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'BJMedium',
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Colors.grey),
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
