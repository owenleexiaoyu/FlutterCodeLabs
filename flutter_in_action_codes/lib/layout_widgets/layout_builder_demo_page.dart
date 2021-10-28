import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class LayoutBuilderDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LayoutBuilder Demo"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DescItem("ResponsiveColumn 效果，父容器没有宽度限制"),
              Container(
                color: Colors.blue.shade50,
                child: ResponsiveColumn(children: [
                  Chip(label: Text("Hello Hello Hello Hello")),
                  Chip(label: Text("World")),
                  Chip(label: Text("OwenLee")),
                ]),
              ),
              DescItem("ResponsiveColumn 效果，父容器有 150 宽度限制"),
              Container(
                color: Colors.blue.shade50,
                width: 150,
                child: ResponsiveColumn(children: [
                  Chip(label: Text("Hello Hello Hello Hello")),
                  Chip(label: Text("World")),
                  Chip(label: Text("OwenLee")),
                ]),
              ),
              DescItem("LayoutLogPrinter 效果，打印父容器约束"),
              Container(
                color: Colors.blue.shade50,
                width: 150,
                child: LayoutLogPrinter(
                    tag: "LayoutLog",
                    child: Chip(label: Text("Hello Hello Hello Hello"))),
              ),
            ],
          ),
        ));
  }
}

/// 响应式的 Column 组件
/// 当父容器最大宽度小于 200 时，显示一列
/// 最大宽度大于 200 时，显示两列
class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 200) {
        return Column(
          children: children,
          mainAxisSize: MainAxisSize.min,
        );
      } else {
        var _children = <Widget>[];
        for (int i = 0; i < children.length; i += 2) {
          if (i + 1 < children.length) {
            _children.add(Row(
              children: [
                children[i],
                children[i + 1],
              ],
              mainAxisSize: MainAxisSize.min,
            ));
          } else {
            _children.add(children[i]);
          }
        }
        return Column(
          children: _children,
          mainAxisSize: MainAxisSize.min,
        );
      }
    });
  }
}

/// 打印父容器传递给子组件的约束信息
class LayoutLogPrinter<T> extends StatelessWidget {
  const LayoutLogPrinter({
    Key? key,
    this.tag,
    required this.child,
  });

  final Widget child;
  final T? tag;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      debugPrint("${tag ?? key ?? child} : $constraints");
      return child;
    });
  }
}
