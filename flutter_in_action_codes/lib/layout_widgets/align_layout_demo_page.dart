import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class AlignLayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对齐与相对定位"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescItem("使用 Align 组件将 FlutterLogo 放置在 Container 容器的右上角"),
              Container(
                width: 120,
                height: 120,
                color: Colors.blue.withOpacity(0.3),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              DescItem("使用 Align widthFactor、heightFactor 属性确定 Align 宽高"),
              Container(
                color: Colors.blue.withOpacity(0.3),
                child: Align(
                  alignment: Alignment.topRight,
                  widthFactor: 2,
                  heightFactor: 2,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              DescItem("Alignment 坐标原点是矩形中心点，Alignment(2,0)"),
              Container(
                color: Colors.blue.withOpacity(0.3),
                child: Align(
                  alignment: Alignment(2,0),
                  widthFactor: 2,
                  heightFactor: 2,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              DescItem("FractionalOffset 坐标原点是矩形左上角顶点，FractionalOffset(1, 1)"),
              Container(
                color: Colors.blue.withOpacity(0.3),
                child: Align(
                  alignment: FractionalOffset(1, 1),
                  widthFactor: 2,
                  heightFactor: 2,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              DescItem("Center 组件, widthFactor, heightFactor = 2"),
              Container(
                color: Colors.blue.withOpacity(0.3),
                child: Center(
                  widthFactor: 2,
                  heightFactor: 2,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              DescItem("Center 组件，widthFactor, heightFactor 为 null"),
              Container(
                color: Colors.blue.withOpacity(0.3),
                child: Center(
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
