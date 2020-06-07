import 'package:flutter/material.dart';

class BackgroundCard extends StatelessWidget {
  final Widget child;
  final ImageProvider image;
  final BorderRadius borderRadius;
  final bool shadow;
  final Color backgroundColor;

  const BackgroundCard({
    Key key,
    @required this.child,
    this.image,
    this.borderRadius,
    this.shadow = true,
    this.backgroundColor = Colors.white,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (image != null) ? _imageDecoration() : _backgroundDecoration(),
      child: this.child,
    );
  }

  BoxDecoration _imageDecoration() {
    return BoxDecoration(
      borderRadius: borderRadius,
      image: DecorationImage(
        image: image, // Decide if backgroundPath is dynamic for constructor
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.4),
          BlendMode.srcOver,
        ),
      ),
    );
  }

  BoxDecoration _backgroundDecoration() {
    return BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
        boxShadow: (shadow)
            ? [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: -1,
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ]
            : []);
  }
}
