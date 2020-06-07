import 'package:flutter/material.dart';

class DiagonalBoxBottomWithShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = DiagonalBoxBottomRight().getClip(size);
    canvas.drawShadow(path, Colors.black, 5, false);
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
    //path.quadraticBezierTo(size.width - 1, 0, size.width - curveDistance - 5, 0 + curveDistance / 3); // top left
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

class DiagonalBox extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const curveDistance = 30.0; // TODO param

    final _DiagonalConfig diagonalConfig = _DiagonalConfig();

    final beginLeftPercent = 0.0; // DIAGONAL
    final beginRightPercent = 0.0; // DIAGONAL
    final endLeftPercent = 0.7; // DIAGONAL
    final endRightPercent = 1.0; // DIAGONAL

    final beginBottomPercent = 0.0; // DIAGONAL
    final beginTopPercent = 0.0; // DIAGONAL
    final endBottomPercent = 1.0; // DIAGONAL
    final endTopPercent = 1.0; // DIAGONAL

    path.moveTo(0.0 + size.width * beginTopPercent, curveDistance + size.height * beginLeftPercent); // initial point
    path.lineTo(0.0 + size.width * beginBottomPercent, size.height * endLeftPercent - curveDistance); // Left Line
    path.quadraticBezierTo(1.0, size.height * endLeftPercent - curveDistance / 3, curveDistance,
        size.height * endLeftPercent); // Bottom Left radius
    path.lineTo(size.width * endBottomPercent - curveDistance - 5, size.height * endRightPercent); // Bottom Line
    path.quadraticBezierTo(
        size.width - 1.0, size.height - 1.0, size.width, size.height - curveDistance); // Bottom Right Radius
    path.lineTo(size.width * endTopPercent, curveDistance + size.height * beginRightPercent); // Right Line
    path.quadraticBezierTo(size.width - 1.0, 1.0, size.width - curveDistance, 0.0); // Top Right Radius
    path.lineTo(curveDistance, 0.0 + size.height * beginLeftPercent); // Top Line
    path.quadraticBezierTo(1.0, 1.0, 0.0, curveDistance); // Top Left Radius

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _DiagonalConfig {
  final double beginXPercent;
  final double endXPercent;
  final double beginYPercent;
  final double endYPercent;

  _DiagonalConfig({
    this.beginXPercent = 0.0,
    this.endXPercent = 1.0,
    this.beginYPercent = 0.0,
    this.endYPercent = 1.0,
  });
}
