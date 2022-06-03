import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '爱心小动画',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("爱心小动画"),
        ),
        body: Container(
          height: double.infinity,
          color: Colors.black87,
          child: LoveWidget(),
        )
    );
  }
}

class LoveWidget extends StatelessWidget {
  const LoveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      margin: EdgeInsets.only(top: 100),
      alignment: Alignment.center,
      child: Container(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoveItem(
              color: Colors.red,
              height: 60.0,
              translateY: -30,
            ),
            LoveItem(
              color: Colors.blueAccent,
              height: 125.0,
              translateY: -60,
              delay: Duration(milliseconds: 200),
            ),
            LoveItem(
              color: Colors.amber,
              height: 160.0,
              translateY: -75.0,
              delay: Duration(milliseconds: 400),
            ),
            LoveItem(
              color: Colors.deepPurpleAccent,
              height: 180.0,
              translateY: -60.0,
              delay: Duration(milliseconds: 600),
            ),
            LoveItem(
              color: Colors.orange,
              height: 200.0,
              translateY: -45.0,
              delay: Duration(milliseconds: 800),
            ),
            LoveItem(
              color: Colors.deepPurpleAccent,
              height: 180.0,
              translateY: -60,
              delay: Duration(milliseconds: 1000),
            ),
            LoveItem(
              color: Colors.amber,
              height: 160.0,
              translateY: -75.0,
              delay: Duration(milliseconds: 1200),
            ),
            LoveItem(
              color: Colors.blueAccent,
              height: 125.0,
              translateY: -60,
              delay: Duration(milliseconds: 1400),
            ),
            LoveItem(
              color: Colors.red,
              height: 60.0,
              translateY: -30,
              delay: Duration(milliseconds: 1600),
            ),
          ],
        ),
      ),
    );
  }
}


class LoveItem extends StatefulWidget {

  final double height;
  final Color color;
  final double translateY;
  // 动画开始的延迟时间
  Duration? delay;

  LoveItem({
    Key? key,
    required this.color,
    required this.height,
    required this.translateY,
    this.delay,
  }) : super(key: key);

  @override
  _LoveItemState createState() => _LoveItemState();
}

class _LoveItemState extends State<LoveItem> with SingleTickerProviderStateMixin {

  late Animation<double> heightAnim;
  late Animation<double> translateYAnim;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,
      duration: Duration(seconds: 4)
    );
    heightAnim = Tween(begin: 0.0, end: widget.height)
    .animate(CurvedAnimation(parent: controller, curve: CustomCurve()))
    ..addListener(() {
      setState(() {});
    });

    translateYAnim = Tween(begin: 0.0, end: widget.translateY)
        .animate(CurvedAnimation(parent: controller, curve: CustomCurve()))
      ..addListener(() {
        setState(() {});
      });

    if (widget.delay != null) {
      Future.delayed(widget.delay!).then((value) => {
        controller.repeat()
      });
    } else {
      controller.repeat();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightAnim.value,
      width: 20,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
      transform: Matrix4.translationValues(0.0, translateYAnim.value, 0.0),
    );
  }
}

class CustomCurve extends Curve {
  final curve = Curves.linear;

  @override
  double transformInternal(double t) {
    if (t < 0.25) {
      return curve.transform(0.0);
    } else if (t < 0.5) {
      return curve.transform(4 * (t - 0.25));
    } else if (t < 0.75) {
      return curve.transform(1.0);
    } else {
      return curve.transform(4 * (1 - t));
    }
  }
}
