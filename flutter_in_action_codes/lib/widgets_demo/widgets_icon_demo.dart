import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';
import 'package:flutter_app/icon_font.dart';

class IconDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icon"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DescItem("文字使用内置的 MaterialIcons 字体图标"),
            Text(
              "\uE914 \uE000 \uE90D",
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
