import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlipCardWidget extends StatefulWidget {
  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animationRotating;
  Animation<double> animationOpacityOut;
  Animation<double> animationOpacityIn;

  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    animationRotating = Tween(begin: 0.0, end: -1.0 * math.pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    animationOpacityOut = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.25, 0.5, curve: Curves.easeIn),
      ),
    );

    animationOpacityIn = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.52, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return Container(
      width: 500, // TODO responsive sizes FIX
      height: 270,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            print('animationRotating ${animationRotating.status}');
            print('animationRotating ${animationRotating.value}');

            return Stack(
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(animationRotating.value),
                  alignment: FractionalOffset.center,
                  child: _BackgroundCard(
                    borderRadius: BorderRadius.circular(25),
                    image: AssetImage('assets/bg4.jpeg'),
                    child: Opacity(
                      opacity: animationOpacityOut.value,
                      child: Center(
                        child: Text('FRONT FACE', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.rotationY(-1.0 * math.pi)
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-animationRotating.value),
                  alignment: FractionalOffset.center,
                  child: Opacity(
                    opacity: animationOpacityIn.value,
                    child: Center(child: Text('BACK FACE', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class _BackgroundCard extends StatelessWidget {
  final Widget child;
  final ImageProvider image;
  final BorderRadius borderRadius;
  final bool shadow;
  final Color backgroundColor;

  const _BackgroundCard({
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
