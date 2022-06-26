import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class ScrollControllerDemoPage extends StatefulWidget {
  const ScrollControllerDemoPage({Key? key}) : super(key: key);

  @override
  _ScrollControllerDemoPageState createState() => _ScrollControllerDemoPageState();
}

class _ScrollControllerDemoPageState extends State<ScrollControllerDemoPage> {

  bool showToTopButton = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      print(offset);
      if (offset < 1000 && showToTopButton) {
        setState(() {
          showToTopButton = false;
        });
      } else if (offset >= 1000 && showToTopButton == false) {
        setState(() {
          showToTopButton = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollControllerDemoPage"),
      ),
      floatingActionButton: !showToTopButton ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DescItem("向下滚动距离超过 1000 时，会展示 FloatingActionButton，点击可返回至列表顶部"),
            Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemExtent: 50,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text("第 $index 项"),
                    );
                  }),),
          ],
        ),
      ),
    );
  }
}
