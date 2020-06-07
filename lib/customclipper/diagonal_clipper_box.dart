import 'package:flutter/material.dart';

class DiagonalBox extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const curveDistance = 30.0; // TODO param

    // initial point
    // Left Line
    // Bottom Left radius
    // Bottom Line
    // Bottom Right Radius
    // Right Line
    // Top Right Radius
    // Top Line
    // Top Left Radius

    path.moveTo(0.0, curveDistance); // initial point
    path.lineTo(0.0, size.height - curveDistance); // Left Line
    path.quadraticBezierTo(1, size.height - 1, 0.0 + curveDistance, size.height); // Bottom Left radius
    path.lineTo(size.width - curveDistance, size.height); // Bottom Line
    path.quadraticBezierTo(
        size.width - 1, size.height - 1, size.width, size.height - curveDistance); // Bottom Right Radius
    path.lineTo(size.width, curveDistance); // Right Line
    path.quadraticBezierTo(size.width - 1, 1, size.width - curveDistance, 0); // Top Right Radius
    path.lineTo(curveDistance, 0); // Top Line
    path.quadraticBezierTo(1, 1, 0, curveDistance); // Top Left Radius
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _XYPoints {
  
  // initial point

  // Left Line
  // Bottom Left radius
  // Bottom Line
  // Bottom Right Radius
  // Right Line
  // Top Right Radius
  // Top Line
  // Top Left Radius
}

class DiagonalBoxBottomWithShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = DiagonalBoxBottomRight().getClip(size);
    canvas.drawShadow(path, Colors.black, 10, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DiagonalBoxTopRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const curveDistance = 30.0;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curveDistance); //left
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height); //bottom left
    path.lineTo(size.width - curveDistance, size.height); // bottom
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width, size.height - curveDistance); // bottom right
    path.lineTo(size.width, 0 + curveDistance); // right
    path.quadraticBezierTo(size.width - 1, 0, size.width - curveDistance - 5, 0 + curveDistance / 3); // top left
    path.lineTo(curveDistance, size.height * 0.29); //diagonal
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
    path.lineTo(size.width - (curveDistance - 5), size.height); // diagonal !!5!!
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - curveDistance + 5); // bottom right
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
