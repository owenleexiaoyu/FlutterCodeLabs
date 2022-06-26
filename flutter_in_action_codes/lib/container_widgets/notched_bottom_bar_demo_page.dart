import 'package:flutter/material.dart';

class NotchedBottomBarDemoPage extends StatelessWidget {
  const NotchedBottomBarDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotchedBottomBarDemoPage"),
      ),
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
            SizedBox(),
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
            IconButton(onPressed: (){}, icon: Icon(Icons.person)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
