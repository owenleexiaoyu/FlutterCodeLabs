import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class FlexLayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("弹性布局 Demo"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DescItem("红色:绿色 = 1:2"),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              DescItem("红色:绿色 = 1:2 分配除 Text 所占空间外的剩余空间"),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Text("Hello"),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              DescItem("蓝色:灰色（Spacer）:橘黄色 = 2:1:1"),
              Container(
                height: 100,
                color: Colors.grey,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blue,
                        height: 30,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.orange,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              DescItem("蓝色:灰色（Spacer）:橘黄色 = 2:1:1，分配除 Text 外的剩余空间"),
              Container(
                height: 100,
                color: Colors.grey,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Text("Hello"),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blue,
                        height: 30,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.orange,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
