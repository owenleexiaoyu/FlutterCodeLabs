import 'package:flutter/material.dart';

class GetStateByGlobalKeyPage extends StatelessWidget {

  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("通过 GlobalKey 获取 State 对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return OutlinedButton(onPressed: () {
            ScaffoldState? _state = _globalKey.currentState;
            _state?.showSnackBar(SnackBar(content: Text("我是SnackBar")));
          }, child: Text("显示 SnackBar"));
        },),
      ),
    );
  }
}
