import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';
import 'package:flutter_app/icon_font.dart';

class TextDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescItem("文字对齐方式"),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: TextAlign.values
                    .map((e) => Container(
                        width: 150,
                        height: 120,
                        color: Colors.green,
                        child: Text("${e.toString()} " * 6, textAlign: e,)))
                    .toList(),
              ),
              DescItem("文字越界效果"),
              Column(
                children: TextOverflow.values.map((e) => Text(
                  "${e.toString() } " * 6,
                  maxLines: 1,
                  overflow: e,
                )).toList(),
              ),
              DescItem("文字缩放系数（1.5）"),
              Text(
                "Hello world",
                textScaleFactor: MediaQuery.textScaleFactorOf(context),
              ),
              DescItem("文字方向（TextDirection.ltr, TextDirection.rtl）"),
              Text(
                "LTR方向(注意标点在右边).",
                textDirection: TextDirection.ltr,
              ),
              Text(
                "RTL方向(注意标点在左边).",
                textDirection: TextDirection.rtl,
              ),
              DescItem("TextStyle 各种属性"),
              Text(
                "这是一个设置了颜色、大小、行高、字体、背景的文本",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  height: 1.5,
                  fontFamily: "Courier",
                  background: Paint()..color = Colors.yellow,
                ),
              ),
              DescItem("TextDecoration 各种值的效果"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TextDecoration.none", style: TextStyle(
                    fontSize: 28,
                    color: Colors.green,
                    decoration: TextDecoration.none,
                  ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "TextDecoration.underline", style: TextStyle(
                    fontSize: 28,
                    color: Colors.yellow,
                    decoration: TextDecoration.underline,
                  ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "TextDecoration.lineThrough", style: TextStyle(
                    fontSize: 28,
                    color: Colors.redAccent,
                    decoration: TextDecoration.lineThrough,
                  ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "TextDecoration.overline", style: TextStyle(
                    fontSize: 28,
                    decoration: TextDecoration.overline,
                  ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "TextDecoration.combine", style: TextStyle(
                    fontSize: 28,
                    color: Colors.blue,
                    decoration: TextDecoration.combine([TextDecoration.lineThrough, TextDecoration.underline,TextDecoration.overline]),
                  ),
                  ),
                ],
              ),
              DescItem("TextDecorationStyle 各种值的效果"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: TextDecorationStyle.values.map((e) {
                  return Text(
                    e.toString(), style: TextStyle(
                      fontSize: 28,
                      decoration: TextDecoration.underline,
                      decorationStyle: e,
                    ),
                  );
                }).toList(),
              ),
              DescItem("Text.rich & TextSpan 多个样式组合"),
              Text.rich(TextSpan(
                  text: "Visit my blog, ",
                  style: TextStyle(
                      backgroundColor: Colors.yellow.withOpacity(0.4)),
                  children: [
                    TextSpan(
                      text: "Link: ",
                    ),
                    TextSpan(
                      text: "https://lixiaoyu.cc",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      // recognizer: _tapRecognizer,
                    )
                  ])),
              DescItem("DefaultTextStyle 及覆盖"),
              DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("一去二三里"),
                      Text("烟村四五家"),
                      Text("亭台六七座"),
                      Text(
                        "八九十枝花",
                        style: TextStyle(
                          inherit: false,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )),
              DescItem("文字自定义字体"),
              Text(
                "窗前明月光",
                style: TextStyle(
                  fontFamily: "FZKTJW",
                ),
              ),
              DescItem("文字使用内置的 MaterialIcons 字体图标"),
              Text(
                "\uE914\uE000\uE90D",
                style: TextStyle(
                    fontFamily: "MaterialIcons",
                    fontSize: 24,
                    color: Colors.blue),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.accessible,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.error,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.fingerprint,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.hail,
                    color: Colors.green,
                  ),
                ],
              ),
              DescItem("使用自定义字体图标"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MyIcons.shoot,
                    color: Colors.pink,
                  ),
                  Icon(
                    MyIcons.wallet,
                    color: Colors.pink,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
