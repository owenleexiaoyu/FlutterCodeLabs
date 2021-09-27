import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

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
            DescItem("LinearProgressIndicator: value=null，会有个循环动画"),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              color: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.yellow),
            ),
            DescItem("LinearProgressIndicator: value=0.5"),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.yellow),
            ),
            DescItem("CircularProgressIndicator: value=null，会有个循环动画"),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation(Colors.pink),
            ),
            DescItem("CircularProgressIndicator: value=0.8, strokeWidth=8"),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation(Colors.pink),
              strokeWidth: 8,
              value: 0.8,
            ),
            DescItem("通过父容器SizedBox指定LinearProgressIndicator的高度"),
            SizedBox(
              height: 10,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
            ),
            DescItem("通过父容器SizedBox指定CircularProgressIndicator的宽高"),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
            ),
            DescItem("当CircularProgressIndicator宽高不一致时，会变成椭圆形"),
            SizedBox(
              height: 50,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
            ),
            DescItem("进度条的颜色有个从灰色到蓝色的动画"),
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
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                .animate(_animationController),
            value: _animationController.value,
          )
        ],
      ),
    );
  }
}