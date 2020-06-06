import 'package:flutter/material.dart';
import 'package:labwidgetsutils/customclipper/diagonal_clipper_box.dart';

class DiagonalBoxPage extends StatelessWidget {
  static const String pageRoute = 'diagonal_box_page_route_id';

  @override
  Widget build(BuildContext context) {
    final size = 300.0;
    return SafeArea(
      child: Column(
        children: [
          ClipPath(
            clipper: DiagonalBoxTopRight(),
            child: Container(
              width: size,
              height: size,
              color: Colors.green,
            ),
          ),
          Container(
            child: Center(
              child: ClipPath(
                clipper: DiagonalBoxBottomRight(),
                child: Container(
                  width: size,
                  height: size,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
