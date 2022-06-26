import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/scrollable_widgets/list_view_demo_page.dart';
import 'package:flutter_app/scrollable_widgets/page_view_demo_page.dart';
import 'package:flutter_app/scrollable_widgets/single_child_scroll_view_demo_page.dart';

class ScrollableWidgetsPage extends StatelessWidget {
  const ScrollableWidgetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可滚动组件"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            HomeItem(title: "SingleChildScrollView Demo", onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SingleChildScrollViewDemoPage();
              }));
            }),
            HomeItem(title: "ListView Demo", onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ListViewDemoPage();
              }));
            }),
            HomeItem(title: "PageView Demo", onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PageViewDemoPage();
              }));
            }),
          ],
        ),
      ),
    );
  }
}
