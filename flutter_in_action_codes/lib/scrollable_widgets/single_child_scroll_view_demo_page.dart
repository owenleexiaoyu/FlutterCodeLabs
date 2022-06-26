import 'package:flutter/material.dart';

class SingleChildScrollViewDemoPage extends StatelessWidget {
  const SingleChildScrollViewDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView Demo"),
      ),
      body: Scrollbar(  // 展示滚动条
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          reverse: true,
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: str.split("")
                  .map((c) => Text(c, style: TextStyle(fontSize: 20),))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
