import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlipCardWidget extends StatefulWidget {
  final BackgroundConfig background;
  final double width;
  final double height;
  final Widget frontFaceWidget;
  final Widget backFaceWidget;
  final AnimationController controllerFlipCard;

  FlipCardWidget({
    Key key,
    @required this.background,
    this.frontFaceWidget,
    this.backFaceWidget,
    this.width,
    this.height,
    this.controllerFlipCard,
  })  : assert(background != null),
        super(key: key);

  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  Animation<double> animationFlip;
  Animation<double> animationOpacityOut;
  Animation<double> animationOpacityIn;

  void initState() {
    super.initState();
    initAnimationsControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
          animation: widget.controllerFlipCard,
          builder: (context, child) {
            print('animationRotating ${animationFlip.status}');
            print('animationRotating ${animationFlip.value}');

            return Stack(
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(animationFlip.value),
                  alignment: FractionalOffset.center,
                  child: _BackgroundCard(
                    backgroundConfig: widget.background,
                    child: Opacity(
                      opacity: animationOpacityOut.value,
                      child: widget.frontFaceWidget,
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.rotationY(-1.0 * math.pi)
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-animationFlip.value),
                  alignment: FractionalOffset.center,
                  child: Opacity(
                    opacity: animationOpacityIn.value,
                    child: widget.backFaceWidget,
                  ),
                ),
              ],
            );
          }),
    );
  }

  void initAnimationsControllers() {
    animationFlip = Tween(begin: 0.0, end: -1.0 * math.pi).animate(
      CurvedAnimation(
        parent: widget.controllerFlipCard,
        curve: Curves.easeIn,
      ),
    );

    animationOpacityOut = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: widget.controllerFlipCard,
        curve: Interval(0.25, 0.5, curve: Curves.easeIn),
      ),
    );

    animationOpacityIn = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.controllerFlipCard,
        curve: Interval(0.52, 1.0, curve: Curves.easeIn),
      ),
    );
  }
}

class _BackgroundCard extends StatelessWidget {
  final BackgroundConfig backgroundConfig;
  final Widget child;

  static const BoxShadow _boxShadow = BoxShadow(
    color: Colors.black12,
    spreadRadius: -1,
    blurRadius: 30,
    offset: Offset(0, 10),
  );

  const _BackgroundCard({
    Key key,
    @required this.backgroundConfig,
    this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (backgroundConfig.image != null) ? _imageDecoration() : _backgroundDecoration(),
      child: this.child,
    );
  }

  BoxDecoration _imageDecoration() {
    return BoxDecoration(
      borderRadius: backgroundConfig.borderRadius,
      image: DecorationImage(
        image: backgroundConfig.image, // Decide if backgroundPath is dynamic for constructor
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.4),
          BlendMode.srcOver,
        ),
      ),
      boxShadow: (backgroundConfig.shadow) ? [_boxShadow] : [],
    );
  }

  BoxDecoration _backgroundDecoration() {
    return BoxDecoration(
      borderRadius: backgroundConfig.borderRadius,
      color: backgroundConfig.backgroundColor,
      boxShadow: (backgroundConfig.shadow) ? [_boxShadow] : [],
    );
  }
}

class BackgroundConfig {
  final ImageProvider image;
  final BorderRadius borderRadius;
  final bool shadow;
  final Color backgroundColor;

  BackgroundConfig({this.image, this.borderRadius, this.shadow = false, this.backgroundColor})
      : assert(image != null || backgroundColor != null),
        assert(image == null || backgroundColor == null, 'Cannot provide both a image and a backgroundColor');
}
