import 'package:flutter/material.dart';

class PageViewDemoPage extends StatefulWidget {
  const PageViewDemoPage({Key? key}) : super(key: key);

  @override
  _PageViewDemoPageState createState() => _PageViewDemoPageState();
}

class _PageViewDemoPageState extends State<PageViewDemoPage> {

  bool isVertical = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageViewDemoPage"),
      ),
      body: PageView(
        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        children: [
          Container(
            color: Colors.redAccent,
          ),
          Container(
            color: Colors.yellowAccent,
          ),
          Container(
            color: Colors.blueAccent,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isVertical = !isVertical;
          });
        },
        child: Icon(isVertical ? Icons.swap_horizontal_circle : Icons.swap_vertical_circle),
      ),
    );
  }
}
