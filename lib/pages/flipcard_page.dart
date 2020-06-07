import 'package:flutter/material.dart';
import 'package:labwidgetsutils/flipcard/flipcard.dart';

class FlipCardPage extends StatelessWidget {
  static const String pageRoute = 'flipcard_page_route_id';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15),
          child: FlipCardWidget(
            background: BackgroundConfig(
              image: AssetImage('assets/bg4.jpeg'),
              borderRadius: BorderRadius.circular(25),
            ),
            frontFaceWidget: Center(
              child: Text('FRONT FACE', style: TextStyle(color: Colors.white)),
            ),
            backFaceWidget: Center(
              child: Text('BACK FACE', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //setState(() {});
          },
          child: Icon(Icons.transform),
        ),
      ),
    );
  }
}
