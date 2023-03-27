import 'package:flutter/material.dart';

abstract class AnimationControllerState<T extends StatefulWidget> extends State<T>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> translate;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    translate = Tween<double>(begin: 0, end: 6).animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
