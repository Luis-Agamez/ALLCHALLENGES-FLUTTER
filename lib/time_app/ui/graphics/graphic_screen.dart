import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'data/laughing_data.dart';
import 'widgets/chart_labels.dart';

class GraphicScreen extends StatefulWidget {
  const GraphicScreen({Key? key}) : super(key: key);
  static const leftPadding = 60.0;
  static const rightPadding = 60.0;
  @override
  State<GraphicScreen> createState() => _GraphicScreenState();
}

class _GraphicScreenState extends State<GraphicScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  static const leftPadding = 60.0;
  static const rightPadding = 60.0;
  double chartHeight = 240;
  late List<ChartDataPoint> chartData;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });

    setState(() {
      chartData = normalizeData(weeksData[0]);
    });

    super.initState();
  }

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

  Path drawPath(bool closePath, double progress) {
    final width = MediaQuery.of(context).size.width;

    final height = chartHeight;
    final segmentWidth =
        (width - leftPadding - rightPadding) / ((chartData.length - 1) * 3);

    final path = Path()..moveTo(0, height - chartData[0].value * height);
    path.lineTo(leftPadding, height - chartData[0].value * height);

    for (var i = 1; i < chartData.length; i++) {
      path.cubicTo(
          (3 * (i - 1) + 1) * segmentWidth + leftPadding * progress,
          height - chartData[i - 1].value * height * progress,
          (3 * (i - 1) + 2) * segmentWidth + leftPadding * progress,
          height - chartData[i].value * height * progress,
          (3 * (i - 1) + 3) * segmentWidth + leftPadding * progress,
          height - chartData[i].value * height * progress);
    }

    path.lineTo(width, height - chartData[chartData.length - 1].value * height);

    if (closePath) {
      path.lineTo(width, height);
      path.lineTo(0, height);
    }

    return path;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
        body: Stack(
      children: [
        DashboardBackground(),
        ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 60),
              alignment: Alignment.center,
              child: const Text(
                'GRAPHIC',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: chartHeight + 80,
              color: const Color.fromARGB(255, 245, 244, 247),
              child: Stack(
                children: [
                  ChartLaughLabels(
                    chartHeight: chartHeight,
                    topPadding: 40,
                    leftPadding: leftPadding,
                    rightPadding: rightPadding,
                    weekData: weeksData[0],
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ChartDayLabels(
                      leftPadding: leftPadding,
                      rightPadding: rightPadding,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: CustomPaint(
                      size:
                          Size(MediaQuery.of(context).size.width, chartHeight),
                      painter: PathPainter(
                          path: drawPath(false, _controller.value),
                          fillPath: drawPath(true, _controller.value)),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}

class DashboardBackground extends StatelessWidget {
  const DashboardBackground({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.center,
              stops: [
            0.2,
            0.8
          ],
              colors: [
            Color.fromARGB(255, 39, 171, 176),
            Color.fromARGB(255, 62, 5, 218),
          ])),
    ));
  }
}

class PathPainter extends CustomPainter {
  final Path path;
  final Path fillPath;

  PathPainter({required this.path, required this.fillPath});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 62, 5, 218)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
    canvas.drawPath(path, paint);
    paint.style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(Offset.zero, Offset(0.0, size.height), [
      Color.fromARGB(255, 218, 5, 5).withOpacity(0.6),
      Color.fromARGB(255, 204, 218, 5).withOpacity(0.85),
      Color.fromARGB(255, 72, 218, 5).withOpacity(0.85),
      Color.fromARGB(255, 5, 9, 218).withOpacity(0.85),
      Color.fromARGB(255, 151, 5, 218).withOpacity(0.85),
    ], [
      0.1,
      0.2,
      0.6,
      0.9,
      1.0
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
