import 'dart:async';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/main.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NeoHome(),
      ),
    );

class NeoHome extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<NeoHome> with TickerProviderStateMixin {
  Color baseColor = Color(0xFFf2f2f2);
  double firstDepth = 50;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;
  double fifthDepth = 50;
  double sixthDepth = 50;
  AnimationController _animationController;

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 7),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => MyApp(),
        ),
      ),
    );

    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });

    controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = Tween<double>(begin: 50, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
    _animationController.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double stagger(value, progress, delay) {
      progress = progress - (1 - delay);
      if (progress < 0) progress = 0;
      return value * (progress / delay);
    }

    double calculatedFirstDepth =
        stagger(firstDepth, _animationController.value, 0.15);
    double calculatedSecondDepth =
        stagger(secondDepth, _animationController.value, 0.30);
    double calculatedThirdDepth =
        stagger(thirdDepth, _animationController.value, 0.45);
    double calculatedFourthDepth =
        stagger(fourthDepth, _animationController.value, 0.60);
    double calculatedfifthDepth =
        stagger(fifthDepth, _animationController.value, 0.75);
    double calculatedsixthDepth =
        stagger(sixthDepth, _animationController.value, 0.90);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Center(
            child: ClayContainer(
              color: baseColor,
              height: 320,
              width: 320,
              borderRadius: 200,
              curveType: CurveType.convex,
              spread: 10,
              depth: calculatedFirstDepth.toInt(),
              child: Center(
                child: ClayContainer(
                  color: baseColor,
                  height: 280,
                  width: 280,
                  borderRadius: 200,
                  curveType: CurveType.concave,
                  spread: 30,
                  depth: calculatedSecondDepth.toInt(),
                  child: Center(
                    child: ClayContainer(
                      color: baseColor,
                      height: 240,
                      width: 240,
                      borderRadius: 200,
                      curveType: CurveType.convex,
                      spread: 30,
                      depth: calculatedThirdDepth.toInt(),
                      child: Center(
                        child: ClayContainer(
                          height: 200,
                          width: 200,
                          borderRadius: 200,
                          depth: calculatedFourthDepth.toInt(),
                          curveType: CurveType.concave,
                          color: baseColor,
                          child: Center(
                            child: ClayContainer(
                              height: 160,
                              width: 160,
                              borderRadius: 200,
                              color: baseColor,
                              depth: calculatedfifthDepth.toInt(),
                              curveType: CurveType.convex,
                              child: Center(
                                child: ClayContainer(
                                  borderRadius: 200,
                                  color: baseColor,
                                  depth: calculatedsixthDepth.toInt(),
                                  curveType: CurveType.convex,
                                  height: animation.value,
                                  width: animation.value,
                                  child: Image.asset('images/logo_trans.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              width: 100,
              child: LinearProgressIndicator(
                minHeight: 5,
                backgroundColor: Colors.teal[100],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
