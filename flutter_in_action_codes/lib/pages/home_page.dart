import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/pages/basic_widgets_page.dart';
import 'package:flutter_app/pages/default_counter_demo.dart';
import 'package:flutter_app/pages/layout_widgets_page.dart';
import 'package:flutter_app/pages/manage_state_page.dart';
import 'package:flutter_app/pages/test_cupertino_style_page.dart';
import 'package:flutter_app/pages/test_get_state_by_context.dart';
import 'package:flutter_app/pages/test_get_state_by_globalkey.dart';
import 'package:flutter_app/pages/test_route_page.dart';
import 'package:flutter_app/pages/test_state_lifecycle_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              HomeItem(
                  title: "默认生成的计数器Demo",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DefaultCounterPage(title: "计数器");
                    }));
                  }),
              HomeItem(
                  title: "测试一些页面跳转",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TestRoutePage(title: "测试一些页面跳转");
                    }));
                  }),
              HomeItem(
                title: "State 声明周期",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CounterWidget();
                  }));
                }),
              HomeItem(
                title: "通过 context 获取 State",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GetStateByContextPage();
                  }));
                },),
              HomeItem(
                title: "通过 GlobalKey 获取 State",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GetStateByGlobalKeyPage();
                  }));
                },
              ),
              HomeItem(
                title: "Cupertino 风格的组件",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CupertinoTestPage();
                  }));
                },
              ),
              HomeItem(
                title: "StatefulWidget 状态管理",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ManageStatePage();
                  }));
                },
              ),
              HomeItem(
                title: "基础 Widget 示例",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BasicWidgetsPage();
                  }));
                },
              ),
              HomeItem(
                title: "布局 Widget 示例",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LayoutWidgetsPage();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}