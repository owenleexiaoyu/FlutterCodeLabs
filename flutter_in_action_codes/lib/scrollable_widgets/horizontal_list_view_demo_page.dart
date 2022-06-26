import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class HorizontalListViewDemoPage extends StatelessWidget {
  const HorizontalListViewDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HorizontalListViewDemoPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DescItem("使用 ListView.builder 来创建垂直方向 ListView"),
            SizedBox(
              height: 200,
              child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
                itemExtent: 100,
                itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.greenAccent : Colors.blueAccent,
              );
            }),),
          ],
        ),
      ),
    );
  }
}
