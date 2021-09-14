
import 'package:flutter/material.dart';
import 'package:flutter_app/icon_font.dart';

class TextDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text demo page"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Hello world(TextAlign.left)",
              textAlign: TextAlign.left,),
              Text("Hello world"*6, maxLines: 1, overflow: TextOverflow.ellipsis,),
              Text("Hello world"*6, maxLines: 1, overflow: TextOverflow.clip,),
              Text("Hello world"*6, maxLines: 1, overflow: TextOverflow.fade,),
              Text("Hello world"*6, maxLines: 1, overflow: TextOverflow.visible,),
              Text("Hello world", textScaleFactor: 1.5,),
              Text("这是一个普通的文本.", textDirection: TextDirection.rtl,),
              Text("这是一个普通的文本.", style: TextStyle(
                color: Colors.teal,
                fontSize: 18,
                height: 1.2,
                fontFamily: "Courier",
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: "Link: ",
                  ),
                  TextSpan(
                    text: "https://lixiaoyu.cc",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )
                ]
              )),
              DefaultTextStyle(style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("一去二三里"),
                  Text("烟村四五家"),
                  Text("亭台六七座"),
                  Text("八九十枝花", style: TextStyle(
                    inherit: false,
                    color: Colors.grey,
                  ),)
                ],
              )),
              Text("窗前明月光", style: TextStyle(
                fontFamily: "FZKTJW",
              ),),
              Text("\uE914\uE000\uE90D",
              style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24,
                color: Colors.blue
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.accessible, color: Colors.green,),
                  Icon(Icons.error, color: Colors.green,),
                  Icon(Icons.fingerprint, color: Colors.green,),
                  Icon(Icons.hail, color: Colors.green,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(MyIcons.shoot, color: Colors.pink,),
                  Icon(MyIcons.wallet, color: Colors.pink,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
