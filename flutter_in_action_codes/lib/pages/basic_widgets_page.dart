import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/widgets_demo/widgets_button_demo.dart';
import 'package:flutter_app/widgets_demo/widgets_checkbox_switch.dart';
import 'package:flutter_app/widgets_demo/widgets_image_demo.dart';
import 'package:flutter_app/widgets_demo/widgets_text_demo.dart';

import '../widgets_demo/widgets_indicator_demo.dart';

class BasicWidgetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基本 Widget 示例"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            HomeItem(
              title: "Text",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TextDemoPage();
                }));
              },
            ),
            HomeItem(
              title: "Button",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ButtonDemoPage();
                }));
              },
            ),
            HomeItem(
              title: "Image",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ImageDemoPage();
                }));
              },
            ),
            HomeItem(
              title: "Switch & CheckBox",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SwitchAndCheckBoxDemoPage();
                }));
              },
            ),
            HomeItem(
              title: "Indicator",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return IndicatorDemoPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
