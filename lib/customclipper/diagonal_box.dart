import 'package:flutter/material.dart';

class DiagonalBoxWidget extends StatelessWidget {
  final double radius;
  final double lessLinePercent;
  final ShadowConfig shadowConfig;
  final Widget child;

  DiagonalBoxWidget({
    this.radius = 30.0,
    this.lessLinePercent = 70,
    this.shadowConfig,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    _DiagonalBoxBottomRight diagonalBox = _DiagonalBoxBottomRight(
      curveDistance: radius,
      lessLinePercent: lessLinePercent / 100,
    );

    CustomPainter shadowPainter = (shadowConfig != null)
        ? _BoxShadow(
            path: diagonalBox,
            elevation: shadowConfig.elevation,
            shadowColor: shadowConfig.shadowColor,
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

class _DiagonalBoxBottomRight extends CustomClipper<Path> {
  final double curveDistance;
  final double lessLinePercent;

  _DiagonalBoxBottomRight({
    @required this.curveDistance,
    @required this.lessLinePercent,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, curveDistance);
    path.lineTo(0, size.height * lessLinePercent - curveDistance); // line left
    path.quadraticBezierTo(1, size.height * lessLinePercent - curveDistance / 3, 0 + curveDistance,
        size.height * lessLinePercent); // Border bottom left
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
