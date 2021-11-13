import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class TransformDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transform 变换示例"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DescItem("Transform.translate 平移"),
              DecoratedBox(decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Transform.translate(
                offset: Offset(-20, -5),
                child: Text("Hello world"),
              ),),
              DescItem("Transform.rotate 旋转"),
              Container(decoration: BoxDecoration(
                color: Colors.red,
              ),
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Transform.rotate(
                  angle: pi / 2,
                  child: Text("Hello world"),
                ),
              ),
              DescItem("Transform 变换是在绘制阶段，不影响宽高大小和位置"),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 50),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Text("Hello world"),
                    ),
                  ),
                  Text(
                    "你好世界",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              DescItem("RotatedBox 也可以让子组件旋转，但是是在布局阶段做的"),
              Row(
                children: [
                  Container(decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                    child: RotatedBox(
                      quarterTurns: 1, // 旋转 90 度，1/4圈
                      child: Text("Hello world"),
                    ),),
                  Text("你好世界", style: TextStyle(
                      color: Colors.green
                  ),)
                ],
              ),
              DescItem("Transform.scale 缩放"),
              DecoratedBox(decoration: BoxDecoration(
                color: Colors.red,
              ),
                child: Transform.scale(
                  scale: 1.5,
                  child: Text("Hello world"),
                ),),
              DescItem("Matrix skew 斜切"),
              Container(decoration: BoxDecoration(
                color: Colors.black,
              ),
                margin: EdgeInsets.symmetric(vertical: 40),
                child: Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.skewY(0.3),
                  child: Container(
                    color: Colors.deepOrange,
                      padding: EdgeInsets.all(8),
                      child: Text("Hello world world")),
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
