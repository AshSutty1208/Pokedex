import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final int fadeInDuration;
  final Widget child;

  FadeIn({required this.fadeInDuration, required this.child});

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        value: 0,
        duration: Duration(milliseconds: widget.fadeInDuration),
        vsync: this)
      ..addStatusListener((status) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future startAnimation() async {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    startAnimation();

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => FadeScaleTransition(
              animation: animationController,
              child: child,
            ),
        child: Visibility(
            visible: animationController.status != AnimationStatus.dismissed,
            child: widget.child),
    );
  }
}
