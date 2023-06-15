import 'package:flutter/material.dart';

class Margin extends StatelessWidget {
  const Margin({
    super.key,
    required this.margin,
    required this.child,
  });

  final EdgeInsets margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: child,
    );
  }
}
