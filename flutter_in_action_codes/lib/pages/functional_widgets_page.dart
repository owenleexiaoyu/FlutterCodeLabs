import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/functional_widgets/will_pop_scope_demo_page.dart';

class FunctionalWidgetsPage extends StatelessWidget {
  const FunctionalWidgetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FunctionalWidgetsPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeItem(title: "导航返回拦截 WillPopScope", onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return WillPopScopeDemoPage();
                }));
              })
            ],
          ),
        ),
      ),
    );
  }
}
