import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class SwitchAndCheckBoxDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchAndCheckBoxDemoPageState();
  }
}

class _SwitchAndCheckBoxDemoPageState extends State<SwitchAndCheckBoxDemoPage> {
  bool _switchSelected = true;
  bool _firstCheckboxSelected = true;
  bool? _secondCheckboxSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch 和 Checkbox"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DescItem("默认样式的 Switch"),
            Switch(
              value: _switchSelected,
              onChanged: ((value) {
                setState(() {
                  _switchSelected = value;
                });
              }),
            ),
            DescItem("自定义外观样式的 Switch"),
            Switch(
              value: _switchSelected,
              onChanged: ((value) {
                setState(() {
                  _switchSelected = value;
                });
              }),
              activeColor: Colors.white,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
            ),
            DescItem("二态 Checkbox（默认样式）\n"
                "二态表示只有选中(true)和不选中(false)两种状态"),
            Checkbox(
              value: _firstCheckboxSelected,
              onChanged: ((value) {
                setState(() {
                  _firstCheckboxSelected = value!;
                });
              }),
            ),
            DescItem("三态 Checkbox（自定义外观样式）\n"
                "三态表示除了选中（true）和未选中（false），还有一种状态为 null，由 tristate=true 指定"),
            Checkbox(
              value: _secondCheckboxSelected,
              onChanged: ((value) {
                setState(() {
                  _secondCheckboxSelected = value;
                });
              }),
              checkColor: Colors.red,
              activeColor: Colors.green,
              focusColor: Colors.yellow,
              hoverColor: Colors.grey,
              tristate: true,
            ),
          ],
        ),
      ),
    );
  }
}
