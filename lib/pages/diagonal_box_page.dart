import 'package:flutter/material.dart';
import 'package:labwidgetsutils/customclipper/diagonal_clipper_box.dart';

class DiagonalBoxPage extends StatelessWidget {
  static const String pageRoute = 'diagonal_box_page_route_id';

  @override
  Widget build(BuildContext context) {
    final size = 280.0;
    return SafeArea(
      child: Center(
        child: ClipPath(
          clipper: DiagonalBox(),
          child: Container(
            //padding: EdgeInsets.all(25),
            width: size,
            height: size,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

/*Column(
        children: [
          SizedBox(height: 20),
          ClipPath(
            clipper: DiagonalBox(),
            child: Container(
              //padding: EdgeInsets.all(25),
              width: size,
              height: size,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Center(
              child: CustomPaint(
                painter: DiagonalBoxBottomWithShadow(),
                child: ClipPath(
                  clipper: DiagonalBoxBottomRight(),
                  child: Container(
                    width: size,
                    height: size,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),*/
