import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/layout_widgets/align_layout_demo_page.dart';
import 'package:flutter_app/layout_widgets/constrined_layout_demo_page.dart';
import 'package:flutter_app/layout_widgets/flex_layout_demo_page.dart';
import 'package:flutter_app/layout_widgets/flow_layout_demo_page.dart';
import 'package:flutter_app/layout_widgets/frame_layout_demo_page.dart';
import 'package:flutter_app/layout_widgets/layout_builder_demo_page.dart';
import 'package:flutter_app/layout_widgets/linear_layout_demo_page.dart';
import 'package:flutter_app/layout_widgets/padding_demo_page.dart';

class LayoutWidgetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局 Widget 示例"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeItem(title: "约束布局", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ConstrainedLayoutDemoPage();
                }));
              }),
              HomeItem(title: "线性布局", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LinearLayoutDemoPage();
                }));
              }),
              HomeItem(title: "弹性布局", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FlexLayoutDemoPage();
                }));
              }),
              HomeItem(title: "流式布局", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FlowLayoutDemoPage();
                }));
              }),
              HomeItem(title: "层叠布局", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FrameLayoutDemoPage();
                }));
              }),
              HomeItem(title: "对齐与相对定位", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AlignLayoutDemoPage();
                }));
              }),
              HomeItem(title: "LayoutBuilder Demo", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LayoutBuilderDemoPage();
                }));
              }),
              HomeItem(title: "Padding Demo", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PaddingDemoPage();
                }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
