import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class DecoratedBoxDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DecoratedBox Demo"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DescItem("宽100，长40的矩形，演示 color 属性"),
            DecoratedBox(decoration: BoxDecoration(
              color: Colors.red
            ),
            child: SizedBox(
              width: 100,
              height: 40,
              child: Center(
                child: Text("Button",style: TextStyle(color: Colors.white),),
              ),
            ),),
            DescItem("宽100，长40的矩形，演示 image 属性"),
            DecoratedBox(decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/chandler2.jpg"),
                  fit: BoxFit.cover
                )
            ),
              child: SizedBox(
                width: 100,
                height: 40,
                child: Center(
                  child: Text("Button",style: TextStyle(color: Colors.white),),
                ),
              ),),
            DescItem("宽100，长40的矩形，演示 border 属性"),
            DecoratedBox(decoration: BoxDecoration(
                border: Border.all()
            ),
              child: SizedBox(
                width: 100,
                height: 40,
                child: Center(
                  child: Text("Button"),
                ),
              ),),
            DescItem("宽100，长40的矩形，演示 borderRadius 属性"),
            DecoratedBox(decoration: BoxDecoration(
                color: Colors.red,
              borderRadius: BorderRadius.circular(5)
            ),
              child: SizedBox(
                width: 100,
                height: 40,
                child: Center(
                  child: Text("Button", style: TextStyle(color: Colors.white),),
                ),
              ),),
            DescItem("宽100，长40的矩形，演示 boxShadow 属性"),
            DecoratedBox(decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [
                  BoxShadow(color: Colors.red, blurRadius: 10)
                ]
            ),
              child: SizedBox(
                width: 100,
                height: 40,
                child: Center(
                  child: Text("Button", style: TextStyle(color: Colors.white),),
                ),
              ),),
            DescItem("宽100，长40的矩形，演示 gradient 属性"),
            DecoratedBox(decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.yellow
                  ]
                )
            ),
              child: SizedBox(
                width: 100,
                height: 40,
                child: Center(
                  child: Text("Button", style: TextStyle(color: Colors.white),),
                ),
              ),),
            DescItem("直径100的圆形，演示 shape 属性"),
            DecoratedBox(decoration: BoxDecoration(
                shape: BoxShape.circle,
              color: Colors.red
            ),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: Text("Button", style: TextStyle(color: Colors.white),),
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
