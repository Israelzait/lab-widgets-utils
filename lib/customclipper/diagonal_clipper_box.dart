import 'package:flutter/material.dart';

class DiagonalBoxTopRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const curveDistance = 30.0;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curveDistance);
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    path.lineTo(size.width - curveDistance, size.height);
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width, size.height - curveDistance);
    path.lineTo(size.width, 0 + curveDistance);
    path.quadraticBezierTo(size.width - 1, 0, size.width - curveDistance - 5, 0 + curveDistance / 3);
    path.lineTo(curveDistance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DiagonalBoxBottomRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const curveDistance = 30.0;

    path.moveTo(0, curveDistance);
    path.lineTo(0, size.height * 0.7 - curveDistance); // line left
    path.quadraticBezierTo(
        1, size.height * 0.7 - curveDistance / 3, 0 + curveDistance, size.height * 0.7); // Border bottom left
    path.lineTo(size.width - curveDistance + 5, size.height); // diagonal !!5!!
    path.quadraticBezierTo(size.width - 1, size.height - 1, size.width, size.height - curveDistance); // bottom right
    path.lineTo(size.width, curveDistance); // right
    path.quadraticBezierTo(size.width, 1, size.width - curveDistance, 0); // top right
    path.lineTo(curveDistance, 0); // top
    path.quadraticBezierTo(0, 1, 0, curveDistance); // top left

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
