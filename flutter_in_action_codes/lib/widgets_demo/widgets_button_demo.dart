import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          children: [
            Row(
              children: [
                RaisedButton(
                  onPressed: () {},
                  child: Text("RaisedButton"),
                ),
                Spacer(
                  flex: 1,
                ),
                ElevatedButton(onPressed: () {}, child: Text("ElevatedButton"))
              ],
            ),
            Row(
              children: [
                RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    label: Text("RaisedButton")),
                Spacer(
                  flex: 1,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    label: Text("ElevatedButton"))
              ],
            ),
            Row(
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text("RaisedButton"),
                ),
                Spacer(
                  flex: 1,
                ),
                TextButton(onPressed: () {}, child: Text("ElevatedButton"))
              ],
            ),
            Row(
              children: [
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    label: Text("RaisedButton")),
                Spacer(
                  flex: 1,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    label: Text("ElevatedButton"))
              ],
            ),
            Row(
              children: [
                OutlineButton(
                  onPressed: () {},
                  child: Text("RaisedButton"),
                ),
                Spacer(
                  flex: 1,
                ),
                OutlinedButton(onPressed: () {}, child: Text("ElevatedButton"))
              ],
            ),
            Row(
              children: [
                OutlineButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    label: Text("RaisedButton")),
                Spacer(
                  flex: 1,
                ),
                OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    label: Text("ElevatedButton"))
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
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
