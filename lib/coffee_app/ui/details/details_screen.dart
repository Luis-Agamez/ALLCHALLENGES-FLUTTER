import 'package:app_one/coffee_app/global/styles.dart';
import 'package:flutter/material.dart';

import '../../domain/models/coffee.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.coffee});
  final Coffee coffee;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backgroundAnimation1;
  late Animation<double> _backgroundAnimation2;
  late Animation<double> _backgroundAnimation3;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _backgroundAnimation1 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.5, curve: Curves.easeInOut));
    _backgroundAnimation2 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 0.8, curve: Curves.easeInOut));
    _backgroundAnimation3 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.8, 1, curve: Curves.easeInOut));

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const animationDuration = Duration(milliseconds: 300);
    return Scaffold(
      backgroundColor: backgroundColorLight,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 10,
              right: 0,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _backgroundAnimation3.value,
                    child: Text(
                      widget.coffee.name,
                      style: TextStyle(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..color = primaryColor,
                          letterSpacing: 1,
                          fontSize: 40,
                          fontFamily: 'CRegular'),
                    ),
                  );
                },
              ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Transform.translate(
                      offset:
                          Offset(0, 800 * (1 - _backgroundAnimation2.value)),
                      child: Container(
                        height: size.height * .55,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35))),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.coffee.name,
                              style: TextStyle(
                                  color: primaryColor,
                                  letterSpacing: 1,
                                  fontSize: 24,
                                  fontFamily: 'PBold'),
                            ),
                            Text(
                              widget.coffee.description,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontFamily: 'PMedium'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Button(label: 'Cold', active: true),
                                SizedBox(width: 10),
                                Button(label: 'Hot', active: false)
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ButtonCount(
                                        sign: '-', color: backgroundColorLight),
                                    const SizedBox(width: 5),
                                    Text(
                                      '0',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 20,
                                          fontFamily: 'PMedium'),
                                    ),
                                    const SizedBox(width: 5),
                                    ButtonCount(
                                        sign: '+', color: backgroundColorLight)
                                  ],
                                ),
                                Text(
                                  '\$18',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 24,
                                      fontFamily: 'PMedium'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
              },
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                  left: 60,
                  right: 0,
                  top: 180,
                  child: Hero(
                    tag: widget.coffee.name,
                    child: Transform.translate(
                      offset:
                          Offset(0, -600 * (1 - _backgroundAnimation1.value)),
                      child: Center(
                        child: Container(
                          width: 310,
                          height: 310,
                          child: Image.asset(widget.coffee.imgUrls.length > 1
                              ? widget.coffee.imgUrls[1]
                              : widget.coffee.imgUrls[0]),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: _backgroundAnimation3.value,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: backgroundColorLight,
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                            Container(
                              width: size.width * .8,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: primaryColor,
                              ),
                              child: const Center(
                                child: Text(
                                  'Order Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    fontSize: 24,
                                    fontFamily: 'PBold',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

class ButtonCount extends StatelessWidget {
  final String sign;
  final Color color;
  const ButtonCount({
    super.key,
    required this.sign,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: color),
      child: Center(
        child: Text(
          sign,
          style: TextStyle(
              color: primaryColor, fontSize: 24, fontFamily: 'PMedium'),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    required this.active,
  });
  final String label;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: active ? primaryColor : Colors.grey),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'PMedium'),
        ),
      ),
    );
  }
}
