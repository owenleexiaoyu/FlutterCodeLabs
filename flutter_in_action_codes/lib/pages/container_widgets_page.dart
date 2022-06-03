import 'package:flutter/material.dart';
import 'package:flutter_app/container_widgets/clip_demo_page.dart';
import 'package:flutter_app/container_widgets/container_demo_page.dart';
import 'package:flutter_app/container_widgets/decoratedbox_demo_page.dart';
import 'package:flutter_app/container_widgets/transform_demo_page.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/container_widgets/padding_demo_page.dart';

class ContainerWidgetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器类 Widget 示例"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeItem(title: "Padding Demo", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PaddingDemoPage();
                }));
              }),
              HomeItem(title: "DecoratedBox Demo", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DecoratedBoxDemoPage();
                }));
              }),
              HomeItem(title: "Transform 变换示例 Demo", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TransformDemoPage();
                }));
              }),
              HomeItem(title: "Container Demo", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ContainerDemoPage();
                }));
              }),
              HomeItem(title: "Clip Demo", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ClipDemoPage();
                }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
