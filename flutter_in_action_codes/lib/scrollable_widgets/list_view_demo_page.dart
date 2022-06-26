import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/scrollable_widgets/horizontal_list_view_demo_page.dart';
import 'package:flutter_app/scrollable_widgets/list_view_separated_demo_page.dart';
import 'package:flutter_app/scrollable_widgets/notification_listener_demo_page.dart';
import 'package:flutter_app/scrollable_widgets/scroll_controller_demo_page.dart';
import 'package:flutter_app/scrollable_widgets/vertical_list_view_demo_page.dart';

class ListViewDemoPage extends StatelessWidget {

  const ListViewDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewDemoPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeItem(title: "垂直方向 ListView", onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return VerticalListViewDemoPage();
                }));
              }),
              HomeItem(title: "水平方向 ListView", onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return HorizontalListViewDemoPage();
                }));
              }),
              HomeItem(title: "使用ListView.separated 创建 ListView", onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return ListViewSeparatedDemoPage();
                }));
              }),
              HomeItem(title: "ScrollController 用法", onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return ScrollControllerDemoPage();
                }));
              }),
              HomeItem(title: "NotificationListener 用法", onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return NotificationListenerDemoPage();
                }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
