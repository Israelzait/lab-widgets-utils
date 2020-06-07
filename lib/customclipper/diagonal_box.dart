import 'package:flutter/material.dart';

class DiagonalBoxWidget extends StatelessWidget {
  final double radius;
  final DiagonalType diagonalType;
  final double minorLinePercent;
  final ShadowConfig shadow;
  final Widget child;

  DiagonalBoxWidget({
    this.radius = 30.0,
    this.diagonalType = DiagonalType.diagonalLeftToBottomRight,
    this.minorLinePercent,
    this.shadow,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    _DiagonalBox diagonalBox = _DiagonalBox(
      curveDistance: radius,
      minorLinePercent: minorLinePercent,
      diagonalType: diagonalType,
    );

    CustomPainter shadowPainter = (shadow != null)
        ? _BoxShadow(
            path: diagonalBox,
            elevation: shadow.elevation,
            shadowColor: shadow.shadowColor,
          )
        : null;

    return CustomPaint(
      painter: shadowPainter,
      child: ClipPath(
        clipper: diagonalBox,
        child: child,
      ),
    );
  }
}

class ShadowConfig {
  final double elevation;
  final Color shadowColor;

  ShadowConfig({
    this.elevation = 5.0,
    this.shadowColor = Colors.white,
  });
}

class _BoxShadow extends CustomPainter {
  final CustomClipper path;
  final double elevation;
  final Color shadowColor;

  _BoxShadow({
    @required this.path,
    this.elevation = 0.0,
    this.shadowColor = Colors.white,
  }) : assert(path != null);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawShadow(path.getClip(size), shadowColor, elevation, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

enum DiagonalType { diagonalLeftToBottomRight, diagonalRightToBottomLeft }

class _DiagonalBox extends CustomClipper<Path> {
  final double curveDistance;
  final double minorLinePercent;
  final DiagonalType diagonalType;

  _DiagonalBox({
    @required this.curveDistance,
    @required this.minorLinePercent,
    @required this.diagonalType,
  });

  @override
  Path getClip(Size size) {
    double minor = minorLinePercent;
    if (minorLinePercent == null) {
      minor = (diagonalType == DiagonalType.diagonalLeftToBottomRight) ? 70.0 : 40.0;
    }

    if (diagonalType == DiagonalType.diagonalLeftToBottomRight)
      return _diagonalLeftToBottomRight(size, minor / 100);
    else
      return _diagonalRightToBottomLeft(size, minor / 100);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

  Path _diagonalLeftToBottomRight(Size size, double minor) {
    final path = Path();

    path.moveTo(0, curveDistance);
    path.lineTo(0, size.height * minor - curveDistance); // line left
    path.quadraticBezierTo(
        1, size.height * minor - curveDistance / 3, 0 + curveDistance, size.height * minor); // Border bottom left
    path.lineTo(size.width - (curveDistance - 5), size.height); // diagonal !!5!!
    path.quadraticBezierTo(
        size.width - 1, size.height - 1, size.width, size.height - curveDistance + 5); // bottom right
    path.lineTo(size.width, curveDistance); // right
    path.quadraticBezierTo(size.width, 1, size.width - curveDistance, 0); // top right
    path.lineTo(curveDistance, 0); // top
    path.quadraticBezierTo(0, 1, 0, curveDistance); // top left

    return path;
  }

  Path _diagonalRightToBottomLeft(Size size, double minor) {
    final path = Path();
    path.moveTo(0, size.height * minor - curveDistance);
    path.lineTo(0, size.height - curveDistance); //left
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height); //bottom left
    path.lineTo(size.width - curveDistance, size.height); // bottom
    path.quadraticBezierTo(size.width - 1, size.height - 1, size.width, size.height - curveDistance); // bottom right
    path.lineTo(size.width, 0 + curveDistance); // right
    path.quadraticBezierTo(size.width - 1, 1, size.width - curveDistance - 5, 0); // top right
    path.lineTo(curveDistance, size.height * minor - curveDistance); //diagonal
    path.quadraticBezierTo(1, size.height * minor - curveDistance - 1 + curveDistance / 3, 0, size.height * minor);

    return path;
  }
}
