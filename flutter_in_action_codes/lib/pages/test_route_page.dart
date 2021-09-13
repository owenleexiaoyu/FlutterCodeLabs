import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class TestRoutePage extends StatelessWidget {
  TestRoutePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                Navigator.pushNamed(context, "new_page", arguments: "hi");
              },
              child: Text("Open new route"),
              textColor: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CupertinoTestRoute();
                }));
              },
              child: Text("Open cupertino test route"),
              textColor: Colors.yellow,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TapBoxA();
                }));
              },
              child: Text("Open TapBoxA route"),
              textColor: Colors.red,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ParentWidget();
                }));
              },
              child: Text("Open TapBoxB route"),
              textColor: Colors.red,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ParentWidgetC();
                }));
              },
              child: Text("Open TapBoxC route"),
              textColor: Colors.red,
            ),
            RandomWordWidget(),
          ],
        ),
      ),
    );
  }
}