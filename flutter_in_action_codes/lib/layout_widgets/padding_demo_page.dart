import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class PaddingDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final container = Container(
      color: Colors.blue,
      width: 60,
      height: 60,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Padding Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DescItem("使用 EdgeInsets.all 设置 10 的 padding"),
            DecoratedBox(decoration: BoxDecoration(
              color: Colors.yellow,
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: container,
            ),),
            DescItem("使用 EdgeInsets.only 设置 10 的 上填充"),
            DecoratedBox(decoration: BoxDecoration(
              color: Colors.yellow,
            ),
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: container,
              ),),
            DescItem("使用 EdgeInsets.symmetric 设置 10 的 左右填充"),
            DecoratedBox(decoration: BoxDecoration(
              color: Colors.yellow,
            ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: container,
              ),),
          ],
        ),
      ),
    );
  }
}
