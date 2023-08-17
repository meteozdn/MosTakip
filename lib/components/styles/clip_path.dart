import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  //var radius = 50.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.height, 0);
    path.lineTo(-size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
