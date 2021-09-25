import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndicatorDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Indicator demo")
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              color: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.yellow),
            ),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.yellow),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation(Colors.pink),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation(Colors.pink),
              strokeWidth: 8,
              value: 0.8,
            ),
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
            ),
            SizedBox(
              height: 50,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
            ),
            AnimatedProgressIndicator()
          ],
        ),
      ),
    );
  }

}


class AnimatedProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedProgressState();
  }

}

class _AnimatedProgressState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
    new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController),
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }

}