import 'package:flutter/material.dart';

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({
    super.key,
    this.duration = const Duration(milliseconds: 800),
    this.child,
    this.offset = 140.0,
    this.curve = Curves.fastOutSlowIn,
    this.offsetDirection = Axis.vertical,
  });

  final Widget? child;
  final Duration duration;
  final double offset;
  final Curve curve;
  final Axis offsetDirection;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: 1, end: 0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: offsetDirection == Axis.horizontal
              ? Offset(value * offset, 0)
              : Offset(0, value * offset),
          child: child,
        );
      },
      child: child,
    );
  }
}
