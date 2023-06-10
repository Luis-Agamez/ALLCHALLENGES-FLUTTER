import 'package:flutter/material.dart';

class PlantHomeScreen extends StatefulWidget {
  const PlantHomeScreen({super.key});

  @override
  State<PlantHomeScreen> createState() => _PlantHomeScreenState();
}

class _PlantHomeScreenState extends State<PlantHomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF59c78c);
    const Color background = Color(0xFFf2f2f2);
    return Scaffold(
      backgroundColor: const Color(0xFF151616),
      body: Stack(
        children: [
          Positioned.fill(
              left: 100,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(200 * (1 - _animationController.value), 0),
                    child: ClipPath(
                      clipper: _CurveTopClipper(),
                      child: Container(
                        color: background,
                        child: const Center(child: Text('Heloo')),
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}

class _CurveTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    final path = Path()
      ..moveTo(width * .1, 0)
      ..lineTo(width * .1, 0)
      ..lineTo(width * .1, height * .20)
      ..cubicTo(width * .1, height * .40, width * .05, height * .41,
          width * .02, height * .415)
      ..cubicTo(width * .02, height * .450, width * .05, height * .46,
          width * .1, height * .48)
      ..lineTo(width * .1, height)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..lineTo(size.width * .1, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
