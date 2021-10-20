import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/layout_widgets/frame_layout_demo_2_page.dart';

class FrameLayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局 Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            HomeItem(title: "层叠布局 Demo2", onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FrameLayoutDemo2Page();
              }));
            }),
            DescItem("Stack 实现层叠布局，Positioned 在 Stack 中进行绝对定位"),
            Expanded(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 20,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.yellow,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            )),
            DescItem("Stack 实现层叠布局，Positioned 在 Stack 中进行绝对定位，\nfit=StackFit.expand，未定位的子组件扩伸到Stack的全部空间"),
            Expanded(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 20,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.yellow.withOpacity(0.4),
                    ),
                  Positioned(
                    top: 20,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
