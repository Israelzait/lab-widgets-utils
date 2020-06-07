import 'package:flutter/material.dart';

class DiagonalBox extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const curveDistance = 30.0; // TODO param

    // initial point
    const double initialPointX = 0.0;
    const double initialPointY = curveDistance;

    // Left Line
    final double leftLineX = 0.0;
    final double leftLineY = size.height - curveDistance;

    // Bottom Left radius
    final double bottomLeftRadiusX = curveDistance;
    final double bottomLeftRadiusY = size.height;

    // Bottom Line
    final double bottomLineX = size.width - curveDistance;
    final double bottomLineY = size.height;

    // Bottom Right Radius
    final double bottomRightRadiusX = size.width;
    final double bottomRightRadiusY = size.height - curveDistance;

    // Right Line
    final double rightLineX = size.width;
    final double rightLineY = curveDistance;

    // Top Right Radius
    final double topRightRadiusX = size.width - curveDistance;
    final double topRightRadiusY = 0.0;

    // Top Line
    final double topLineX = curveDistance;
    final double topLineY = 0.0;

    // Top Left Radius
    final double topLeftRadiusX = 0.0;
    final double topLeftRadiusY = curveDistance;

    path.moveTo(initialPointX, initialPointY); // initial point
    path.lineTo(leftLineX, leftLineY); // Left Line
    path.quadraticBezierTo(1, size.height - 1, bottomLeftRadiusX, bottomLeftRadiusY); // Bottom Left radius
    path.lineTo(bottomLineX, bottomLineY); // Bottom Line
    path.quadraticBezierTo(
        size.width - 1, size.height - 1, bottomRightRadiusX, bottomRightRadiusY); // Bottom Right Radius
    path.lineTo(rightLineX, rightLineY); // Right Line
    path.quadraticBezierTo(size.width - 1, 1, topRightRadiusX, topRightRadiusY); // Top Right Radius
    path.lineTo(topLineX, topLineY); // Top Line
    path.quadraticBezierTo(1, 1, topLeftRadiusX, topLeftRadiusY); // Top Left Radius
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
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
