import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60); // Start from the bottom-left corner
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2,
        size.height - 50); // Curve down to the middle
    path.quadraticBezierTo(3 * size.width / 4, size.height - 100, size.width,
        size.height - 60); // Curve back up to the right
    path.lineTo(size.width, 0); // Line to the top-right corner
    path.lineTo(0, 0); // Line to the top-left corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
