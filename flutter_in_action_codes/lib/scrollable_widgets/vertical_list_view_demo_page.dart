import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class VerticalListViewDemoPage extends StatelessWidget {
  const VerticalListViewDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VerticalListViewDemoPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DescItem("使用 children 来创建垂直方向 ListView"),
            Expanded(child: ListView(

              children: [
                Text("Hello"),
                Text("World"),
                Text("Hello"),
                Text("Flutter"),
                Text("Hello"),
                Text("World"),
                Text("Hello"),
                Text("Flutter"),
                Text("Hello"),
                Text("World"),
                Text("Hello"),
                Text("Flutter"),
                Text("Hello"),
                Text("World"),
                Text("Hello"),
                Text("Flutter"),
                Text("Hello"),
                Text("World"),
                Text("Hello"),
                Text("Flutter"),
                Text("Hello"),
                Text("World"),
                Text("Hello"),
                Text("Flutter"),
                Text("Hello"),
                Text("World"),
                Text("Hello"),
                Text("Flutter"),
                Text("Hello"),
                Text("World"),
                Text("Hello"),
                Text("Flutter"),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
