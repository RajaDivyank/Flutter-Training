import 'package:flutter/material.dart';

class CustomGradientContainer extends StatelessWidget {
  final double height;
  final double? width;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomGradientContainer({
    super.key,
    required this.height,
    this.width,
    this.child,
    this.borderRadius,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF9558FE), Color(0xFFC681FE)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
