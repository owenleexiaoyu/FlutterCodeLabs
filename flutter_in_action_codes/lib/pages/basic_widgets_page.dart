import 'package:flutter/material.dart';
import 'package:flutter_app/basic_widgets/widgets_text_demo.dart';
import 'package:flutter_app/basic_widgets/widgets_textfield_demo.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/basic_widgets/widgets_button_demo.dart';
import 'package:flutter_app/basic_widgets/widgets_checkbox_switch.dart';
import 'package:flutter_app/basic_widgets/widgets_icon_demo.dart';
import 'package:flutter_app/basic_widgets/widgets_image_demo.dart';

import '../basic_widgets/widgets_indicator_demo.dart';

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
              title: "Icon",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return IconDemoPage();
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
              title: "TextField & Form",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TextFieldDemoPage();
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
