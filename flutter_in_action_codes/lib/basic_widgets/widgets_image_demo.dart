import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class ImageDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/chandler2.jpg");
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DescItem("使用 AssetImage 加载 asset 中图片"),
            Image(
              image: img,
              width: 100,
            ),
            DescItem("使用 Image.asset() 加载 asset 中图片"),
            Image.asset(
              "images/chandler2.jpg",
              width: 100,
            ),
            DescItem("使用 NetworkImage 加载网络图片"),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100,
            ),
            DescItem("使用 Image.network() 加载网络图片"),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100,
            ),
            DescItem("各种 BoxFit 的效果"),
            Column(
              children: BoxFit.values.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        child: Image(
                          image: img,
                          fit: e,
                        ),
                        decoration: BoxDecoration(color: Colors.yellow),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(e.toString())
                    ],
                  ),
                );
              }).toList(),
            ),
            DescItem("各种 BlendMode 效果(黄色是Container背景色)"),
            Column(
              children: BlendMode.values.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: img,
                          color: Colors.blue,
                          colorBlendMode: e,
                        ),
                        decoration: BoxDecoration(color: Colors.yellow),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(e.toString())
                    ],
                  ),
                );
              }).toList(),
            ),
            DescItem("各种 ImageRepat 效果"),
            Column(
              children: ImageRepeat.values.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 200,
                        child: Image(
                          image: img,
                          repeat: e,
                        ),
                        decoration: BoxDecoration(color: Colors.yellow),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(e.toString())
                    ],
                  ),
                );
              }).toList(),
            ),
          ]),
        ),
      ),
    );
  }
}
