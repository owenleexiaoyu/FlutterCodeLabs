import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class LinearLayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局 Demo"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DescItem("Column 垂直排列"),
              Column(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.all(5),
                    color: Colors.red,
                  ),
                  Container(
                    height: 20,
                    width: 40,
                    margin: EdgeInsets.all(5),
                    color: Colors.green,
                  )
                ],
              ),
              DescItem("Column 垂直排列， CrossAxisAlignment.start"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.all(5),
                    color: Colors.red,
                  ),
                  Container(
                    height: 20,
                    width: 40,
                    margin: EdgeInsets.all(5),
                    color: Colors.green,
                  )
                ],
              ),
              DescItem("Column 垂直排列， CrossAxisAlignment.end"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.all(5),
                    color: Colors.red,
                  ),
                  Container(
                    height: 20,
                    width: 40,
                    margin: EdgeInsets.all(5),
                    color: Colors.green,
                  )
                ],
              ),
              DescItem("Row 水平排列"),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.all(5),
                    color: Colors.red,
                  ),
                  Container(
                    height: 40,
                    width: 20,
                    margin: EdgeInsets.all(5),
                    color: Colors.green,
                  )
                ],
              ),
              DescItem("Row 水平排列， CrossAxisAlignment.start"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.all(5),
                    color: Colors.red,
                  ),
                  Container(
                    height: 40,
                    width: 20,
                    margin: EdgeInsets.all(5),
                    color: Colors.green,
                  )
                ],
              ),
              DescItem("Row 水平排列， CrossAxisAlignment.end"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.all(5),
                    color: Colors.red,
                  ),
                  Container(
                    height: 40,
                    width: 20,
                    margin: EdgeInsets.all(5),
                    color: Colors.green,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
