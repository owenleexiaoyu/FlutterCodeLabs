import 'package:flutter/material.dart';
import 'package:flutter_app/pages/default_counter_demo.dart';
import 'package:flutter_app/pages/test_get_state_by_context.dart';
import 'package:flutter_app/pages/test_get_state_by_globalkey.dart';
import 'package:flutter_app/pages/test_route_page.dart';
import 'package:flutter_app/pages/test_state_lifecycle_page.dart';
import 'package:flutter_app/widgets_button_demo.dart';
import 'package:flutter_app/widgets_checkbox_switch.dart';
import 'package:flutter_app/widgets_image_demo.dart';

import '../widgets_indicator_demo.dart';
import '../widgets_text_demo.dart';

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
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DefaultCounterPage(title: "计数器");
                  }));
                },
                child: Text("默认生成的计数器Demo"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TestRoutePage(title: "测试一些页面跳转");
                  }));
                },
                child: Text("测试一些页面跳转"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CounterWidget();
                  }));
                },
                child: Text("State 声明周期"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GetStateByContextPage();
                  }));
                },
                child: Text("通过 context 获取 State"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GetStateByGlobalKeyPage();
                  }));
                },
                child: Text("通过 GlobalKey 获取 State"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TextDemoPage();
                  }));
                },
                child: Text("Text Widget Demo"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ButtonDemoPage();
                  }));
                },
                child: Text("Button Widget Demo"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImageDemoPage();
                  }));
                },
                child: Text("Image Widget Demo"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SwitchAndCheckBoxDemoPage();
                  }));
                },
                child: Text("Switch and Checkbox Widget Demo"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return IndicatorDemoPage();
                  }));
                },
                child: Text("Indicator Widget Demo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}