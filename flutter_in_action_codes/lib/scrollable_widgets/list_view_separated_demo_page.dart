import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class ListViewSeparatedDemoPage extends StatelessWidget {
  const ListViewSeparatedDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewSeparatedDemoPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DescItem("使用ListView.separated 创建带分隔线的 ListView"),
            Expanded(
              child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) {
                    return Divider(height: 1,
                    color: index % 2 == 0 ? Colors.greenAccent : Colors.blueAccent,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                        alignment: Alignment.center,
                        child: Text("第 $index 项"));
                  }),),
          ],
        ),
      ),
    );
  }
}
