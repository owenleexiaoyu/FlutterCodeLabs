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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DescItem("文字对齐方式"),
            Text(
              "Hello world(TextAlign.left)",
              textAlign: TextAlign.left,
            ),
            DescItem("文字越界效果（ellipsis, clip, fade, visible）"),
            Text(
              "Hello world" * 6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world" * 6,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            Text(
              "Hello world" * 6,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
            Text(
              "Hello world" * 6,
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            DescItem("文字缩放系数（1.5）"),
            Text(
              "Hello world",
              textScaleFactor: 1.5,
            ),
            DescItem("文字方向（TextDirection.ltr, TextDirection.rtl）"),
            Text(
              "这是一个普通的文本.",
              textDirection: TextDirection.rtl,
            ),
            DescItem("TextStyle 各种属性"),
            Text(
              "这是一个普通的文本.",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 18,
                height: 1.2,
                fontFamily: "Courier",
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            DescItem("Text.rich & TextSpan 多个样式组合"),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "Link: ",
              ),
              TextSpan(
                text: "https://lixiaoyu.cc",
                style: TextStyle(
                  color: Colors.blue,
                ),
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
    );
  }
}
