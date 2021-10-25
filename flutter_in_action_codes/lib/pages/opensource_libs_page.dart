import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';
import 'package:flutter_app/opensource_libs/sp_plugin_lib_page.dart';

class OpenSourceLibsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("三方开源库"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            HomeItem(
              title: "shared_preferences plugin",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SpPluginLibPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
