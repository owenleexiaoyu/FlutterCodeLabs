import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class FlowLayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局 Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescItem("Wrap 实现流式布局"),
              Wrap(
                children: [
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text("A"),
                    ),
                    label: Text("AAA"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text("B"),
                    ),
                    label: Text("BBBBB"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text("C"),
                    ),
                    label: Text("CCCCCCCCCCCC"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text("D"),
                    ),
                    label: Text("DDDDDDDDDDDDDDDDDD"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text("E"),
                    ),
                    label: Text("EEEEEEE"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text("F"),
                    ),
                    label: Text("FF"),
                  ),
                ],
              ),
              DescItem("Wrap 实现流式布局，spacing=10, runSpacing=20"),
              Wrap(
                spacing: 10,
                runSpacing: 20,
                children: [
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text("A"),
                    ),
                    label: Text("AAA"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text("B"),
                    ),
                    label: Text("BBBBB"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text("C"),
                    ),
                    label: Text("CCCCCCCCCCCC"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text("D"),
                    ),
                    label: Text("DDDDDDDDDDDDDDDDDD"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text("E"),
                    ),
                    label: Text("EEEEEEE"),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text("F"),
                    ),
                    label: Text("FF"),
                  ),
                ],
              ),
              DescItem("Flow 自定义流式布局"),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Flow(
                  delegate: MyFlowDelegate(childMargin: EdgeInsets.all(10)),
                  children: [
                    Container(width: 80.0, height:80.0, color: Colors.red,),
                    Container(width: 80.0, height:80.0, color: Colors.green,),
                    Container(width: 80.0, height:80.0, color: Colors.blue,),
                    Container(width: 80.0, height:80.0,  color: Colors.yellow,),
                    Container(width: 80.0, height:80.0, color: Colors.brown,),
                    Container(width: 80.0, height:80.0,  color: Colors.purple,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyFlowDelegate extends FlowDelegate {

  EdgeInsets childMargin;

  MyFlowDelegate({this.childMargin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {

    var x = childMargin.left;
    var y = childMargin.top;

    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + childMargin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = w + childMargin.left;
      } else {
        x = childMargin.left;
        y += context.getChildSize(i)!.height + childMargin.top + childMargin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i)!.width + childMargin.left + childMargin.right;
      }
    }

  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(300, 300);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

}
