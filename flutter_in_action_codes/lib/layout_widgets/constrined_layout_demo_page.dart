import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class ConstrainedLayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    const redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

    return Scaffold(
      appBar: AppBar(
        title: Text("约束布局 Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DescItem("ConstrainedBox 限制最小高度"),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50,
              ),
              child: Container(
                height: 5,
                child: redBox,
              ),
            ),
            DescItem("SizedBox 限制宽高"),
            SizedBox(
              width: 80,
              height: 80,
              child: redBox,
            ),
            DescItem(
                "RedBox 有父子多重限制（minWidth和minHeight），最终Redbox的宽高为 90 * 260"),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 60,
                minHeight: 60,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90, minHeight: 20),
                child: redBox,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 90,
                minHeight: 20,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60, minHeight: 60),
                child: redBox,
              ),
            ),
            DescItem("RedBox 有父子多重限制（maxWidth和maxHeight），最终Redbox的宽高为 60 * 20"),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 90,
                maxHeight: 20,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 60, maxHeight: 60),
                child: Container(height: 100, width: 100, child: redBox),
              ),
            ),
            SizedBox(height: 10),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 60,
                maxHeight: 60,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 90, maxHeight: 20),
                child: Container(height: 100, width: 100, child: redBox),
              ),
            ),
            DescItem("UnconstrainedBox 用于去除多重限制"),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 60,
                minHeight: 60,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: UnconstrainedBox(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90, minHeight: 20),
                    child: redBox,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90, minHeight: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: UnconstrainedBox(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 60, minHeight: 60),
                    child: redBox,
                  ),
                ),
              ),
            ),
            Row()
          ],
        ),
      ),
    );
  }
}
