import 'package:flutter/material.dart';

class WillPopScopeDemoPage extends StatefulWidget {
  const WillPopScopeDemoPage({Key? key}) : super(key: key);

  @override
  _WillPopScopeDemoPageState createState() => _WillPopScopeDemoPageState();
}

class _WillPopScopeDemoPageState extends State<WillPopScopeDemoPage> {

  DateTime? lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WillPopScopeDemoPage"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (lastPressedAt == null ||
              DateTime.now().difference(lastPressedAt!) > Duration(seconds: 1)) {
            lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        }, child: Container(
        alignment: Alignment.center,
        child: Text(
          "1s 内双击两次返回键可退出页面"
        ),
      )),
    );
  }
}
