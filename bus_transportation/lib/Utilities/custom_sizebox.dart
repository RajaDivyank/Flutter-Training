import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Border? border;
  final Widget? child;

  const CustomSizedBox({super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.color = Colors.transparent,
    this.border,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: border,
      ),
      child: child,
    );
  }
}