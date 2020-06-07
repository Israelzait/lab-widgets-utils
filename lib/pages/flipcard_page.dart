import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:labwidgetsutils/flipcard/flipcard.dart';

class FlipCardPage extends StatefulWidget {
  static const String pageRoute = 'flipcard_page_route_id';

  @override
  _FlipCardPageState createState() => _FlipCardPageState();
}

class _FlipCardPageState extends State<FlipCardPage> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15),
          child: Container(
            width: 500,
            height: 270,
            child: FlipCardWidget(
              controllerFlipCard: animationController,
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
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                animationController.forward();
              },
              child: Icon(Icons.transform),
            ),
            FloatingActionButton(
              onPressed: () {
                animationController.reverse();
              },
              child: Icon(Icons.delete_forever),
            )
          ],
        ),
      ),
    );
  }
}
