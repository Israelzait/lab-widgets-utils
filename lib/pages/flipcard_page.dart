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
          child: FlipCardWidget(),
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
