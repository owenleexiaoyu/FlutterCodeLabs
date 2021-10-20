import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class FrameLayoutDemo2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局Demo2"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DescItem("Stack 实现层叠布局 alignment=topStart"),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                ),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.red,
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 150,
                      height: 150,
                    ),
                    Container(
                      color: Colors.green,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              DescItem("Stack 实现层叠布局 alignment=Alignment.center"),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 150,
                      height: 150,
                    ),
                    Container(
                      color: Colors.green,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              DescItem("Stack 实现层叠布局 alignment=Alignment.center 蓝色块 Positioned top=10"),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 150,
                      height: 150,
                    ),
                    Container(
                      color: Colors.green,
                      width: 100,
                      height: 100,
                    ),
                    Positioned(
                      top: 10,
                      child: Container(
                        color: Colors.blue,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
              DescItem("Stack 实现层叠布局 alignment=Alignment.center \n蓝色块 Positioned top=10 \nfit=StackFit.expand"),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 150,
                      height: 150,
                    ),
                    Container(
                      color: Colors.green,
                      width: 100,
                      height: 100,
                    ),
                    Positioned(
                      top: 10,
                      child: Container(
                        color: Colors.blue,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
