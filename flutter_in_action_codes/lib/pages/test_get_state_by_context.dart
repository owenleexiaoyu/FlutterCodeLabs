import 'package:flutter/material.dart';

class GetStateByContextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中通过 context 获取 State 对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return OutlinedButton(onPressed: () {
            ScaffoldState? _state = context.findAncestorStateOfType<ScaffoldState>();
            _state?.showSnackBar(SnackBar(content: Text("我是SnackBar")));
          }, child: Text("显示 SnackBar"));
        },),
      ),
    );
  }
}
