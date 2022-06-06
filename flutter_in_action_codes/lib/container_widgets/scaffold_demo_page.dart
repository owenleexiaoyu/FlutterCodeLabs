import 'package:flutter/material.dart';
import 'package:flutter_app/container_widgets/notched_bottom_bar_demo_page.dart';
import 'package:flutter_app/container_widgets/round_avatar_widget.dart';

class ScaffoldDemoPage extends StatefulWidget {
  const ScaffoldDemoPage({Key? key}) : super(key: key);

  @override
  _ScaffoldDemoPageState createState() => _ScaffoldDemoPageState();
}

class _ScaffoldDemoPageState extends State<ScaffoldDemoPage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.favorite_border_outlined),
        title: Text("Scaffold Demo Page"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text(
          "Scaffold demo page"
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return NotchedBottomBarDemoPage();
          }));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "种草"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "通知"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
        Container(
          color: Colors.greenAccent,
          height: 200,
          alignment: Alignment.center,
          child: RoundAvatarWidget(
            child: Image.asset("images/chandler2.jpg"),
            size: 60,
            borderWidth: 2,
            borderColor: Colors.white,
          ),
        ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("设置"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("语言"),
            onTap: (){},
          ),
      ]
      ),
    );
  }
}
