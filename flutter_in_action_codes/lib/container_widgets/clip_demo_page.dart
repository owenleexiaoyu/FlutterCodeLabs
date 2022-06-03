import 'package:flutter/material.dart';
import 'package:flutter_app/container_widgets/custom_rect_clipper.dart';
import 'package:flutter_app/container_widgets/round_avatar_widget.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class ClipDemoPage extends StatelessWidget {
  const ClipDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset("images/chandler2.jpg", width: 60.0,);
    return Scaffold(
      appBar: AppBar(
        title: Text("Clip Demo Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DescItem("不裁剪"),
              avatar, // 不裁剪
              DescItem("裁剪成圆形"),
              ClipOval(child: avatar,), // 裁剪成圆形
              DescItem("裁剪成圆角矩形"),
              ClipRRect(          // 裁剪成圆角矩形
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
              ),
              DescItem("溢出时不裁剪"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 0.5, // 宽度设为原来宽度的一半，另一半溢出
                    child: avatar,
                  ),
                  Text("Hello", style: TextStyle(color: Colors.blueAccent),),
                ],
              ),
              DescItem("溢出时裁剪"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 0.5, // 宽度设为原来宽度的一半，另一半溢出
                      child: avatar,
                    ),
                  ),
                  Text("Hello", style: TextStyle(color: Colors.blueAccent),),
                ],
              ),
              DescItem("自定义 Clipper"),
              Container(
                color: Colors.blueAccent,
                child: ClipRect(
                  clipper: CustomRectClipper(),
                    child: avatar
                  ),
              ),
              DescItem("自定义带边框圆形头像组件"),
              RoundAvatarWidget(size: 60, child: avatar, borderWidth: 4, borderColor: Colors.orange,),
            ],
          ),
        ),
      ),
    );
  }
}


