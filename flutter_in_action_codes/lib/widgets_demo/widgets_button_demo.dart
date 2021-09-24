import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class ButtonDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Widgets Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DescItem("旧版本按钮和新版本按钮对比"),
            Text("普通的 RaisedButton 和 ElevatedButton"),
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("RaisedButton"),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                SizedBox(
                    width: 180,
                    child: ElevatedButton(onPressed: () {}, child: Text("ElevatedButton")))
              ],
            ),
            Text("带 Icon 的 RaisedButton 和 ElevatedButton"),
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.star),
                      label: Text("RaisedButton")),
                ),
                Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: 180,
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.star),
                      label: Text("ElevatedButton")),
                )
              ],
            ),
            Text("普通的 FlatButton 和 TextButton"),
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text("FlatButton"),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                SizedBox(
                    width: 180,
                    child: TextButton(onPressed: () {}, child: Text("TextButton")))
              ],
            ),
            Text("带 Icon 的 FlatButton 和 TextButton"),
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.star),
                      label: Text("FlatButton")),
                ),
                Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: 180,
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.star),
                      label: Text("TextButton")),
                )
              ],
            ),
            Text("普通的 OutlineButton 和 OutlinedButton"),
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: OutlineButton(
                    onPressed: () {},
                    child: Text("OutlineButton"),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                SizedBox(
                    width: 180,child: OutlinedButton(onPressed: () {}, child: Text("OutlinedButton")))
              ],
            ),
            Text("带 Icon 的 OutlineButton 和 OutlinedButton"),
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: OutlineButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.star),
                      label: Text("OutlineButton")),
                ),
                Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: 180,
                  child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.star),
                      label: Text("OutlinedButton")),
                )
              ],
            ),
            DescItem("IconButton"),
            IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
            DescItem("自定义Button样式"),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                )),
            FlatButton(
              onPressed: () {},
              child: Text("Login"),
              color: Colors.green,
              highlightColor: Colors.green[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
    );
  }
}
