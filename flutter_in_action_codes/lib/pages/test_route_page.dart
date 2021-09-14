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
            RandomWordWidget(),
          ],
        ),
      ),
    );
  }
}