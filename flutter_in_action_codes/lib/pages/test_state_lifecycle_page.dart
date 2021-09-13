import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/console_view.dart';

/// 这个代码是为了演示 State 的生命周期
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, this.initValue: 0});

  final int initValue;

  @override
  State<StatefulWidget> createState() {
    return new _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  String log = "";

  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    print("initState");

    setState(() {
      log += "\ninitState";
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    setState(() {
      log += "\nbuild";
    });
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ConsoleView(log),
          ),
          Center(
            child: FlatButton(
              child: Text("$_counter"),
              // 点击后计数器自增
              onPressed: () => setState(() => ++_counter),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    setState(() {
      log += "\ndidUpdateWidget";
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
    // setState(() {
    //   log += "\ndeactivate";
    // });
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
    // setState(() {
    //   log += "\ndispose";
    // });
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
    setState(() {
      log += "\nreassemble";
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
    setState(() {
      log += "\ndidChangeDependencies";
    });
  }
}