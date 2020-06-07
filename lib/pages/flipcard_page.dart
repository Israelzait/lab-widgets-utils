import 'package:flutter/material.dart';
import 'package:labwidgetsutils/flipcard/flipcard.dart';

class FlipCardPage extends StatelessWidget {
  static const String pageRoute = 'flipcard_page_route_id';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 270,
      padding: EdgeInsets.all(25),
      child: Stack(
        children: [
          BackgroundCard(
            borderRadius: BorderRadius.circular(25),
            child: Center(
              child: Text('text', style: TextStyle()),
            ),
          ),
        ],
      ),
    );
  }
}
