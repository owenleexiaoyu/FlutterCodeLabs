import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class NotificationListenerDemoPage extends StatefulWidget {
  const NotificationListenerDemoPage({Key? key}) : super(key: key);

  @override
  _NotificationListenerDemoPageState createState() => _NotificationListenerDemoPageState();
}

class _NotificationListenerDemoPageState extends State<NotificationListenerDemoPage> {

  String _progress = "0%"; // 保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationListenerDemoPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DescItem("向下滚动距离超过 1000 时，会展示 FloatingActionButton，点击可返回至列表顶部"),
            Expanded(
              child: NotificationListener(
                onNotification: (ScrollNotification notification) {
                  double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
                  setState(() {
                    _progress = "${(progress * 100).toInt()}%";
                  });
                  print("BottomEdge: ${notification.metrics.extentAfter == 0}");
                  return false;
                },
                child: Stack(
                  alignment: Alignment.center,
                  children:[
                    ListView.builder(
                    itemCount: 100,
                    itemExtent: 50,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text("第 $index 项"),
                      );
                    }),
                    CircleAvatar(radius: 30,
                    child: Text(_progress),
                    backgroundColor: Colors.black54,),
                  ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
