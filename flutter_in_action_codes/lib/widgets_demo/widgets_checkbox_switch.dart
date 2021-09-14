import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Text("Switch and Checkbox"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Switch:"),
                Switch(
                  value: _switchSelected,
                  onChanged: ((value) {
                    setState(() {
                      _switchSelected = value;
                    });
                  }),
                ),
                Switch(
                  value: _switchSelected,
                  onChanged: ((value) {
                    setState(() {
                      _switchSelected = value;
                    });
                  }),
                  activeColor: Colors.yellow,
                  inactiveThumbColor: Colors.pink,
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                ),
              ],
            ),
            Row(children: [
              Text("二态 Checkbox:"),
              Checkbox(
                value: _firstCheckboxSelected,
                onChanged: ((value) {
                  setState(() {
                    _firstCheckboxSelected = value!;
                  });
                }),
              ),
              Text("三态 Checkbox:"),
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
            ],),
          ],
        ),
      ),
    );
  }
}
