import 'package:flutter/material.dart';

class ContainerDemoPage extends StatelessWidget {
  const ContainerDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 50),
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: 0.98,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
              )
            ],
          ),
          transform: Matrix4.rotationZ(0.2),
          alignment: Alignment.center,
          child: Text(
            "5.2", style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
