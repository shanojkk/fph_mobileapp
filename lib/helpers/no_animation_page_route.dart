import 'package:flutter/material.dart';

class NoAnimationPageRoute<T> extends PageRoute<T> {
  NoAnimationPageRoute({required this.builder});

  final WidgetBuilder builder;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration.zero;
}
