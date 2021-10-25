import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpPluginLibPage extends StatefulWidget {
  @override
  _SpPluginLibPageState createState() => _SpPluginLibPageState();
}

class _SpPluginLibPageState extends State<SpPluginLibPage> {
  static const String KEY_COUNT = "sp_key_count";

  /// 计数值
  int count = 0;

  Future<SharedPreferences> spFuture = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    readCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreferences Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            "你一共点击了 $count 次"
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          storeCount(count + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }


  void readCount() async {
    SharedPreferences sp = await spFuture;
    setState(() {
      count = sp.getInt(KEY_COUNT) ?? 0;
    });
  }

  void storeCount(int count) async {
    SharedPreferences sp = await spFuture;
    await sp.setInt(KEY_COUNT, count);
    setState(() {
      this.count = count;
    });
  }
}
