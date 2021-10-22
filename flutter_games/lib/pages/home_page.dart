import 'package:flutter/material.dart';
import 'package:flutter_games/games/2048/game_2048_page.dart';
import 'package:flutter_games/games/snake/game_snake_page.dart';
import 'package:flutter_games/widgets/home_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Games"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeItem(title: "2048", onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Game2048Page();
              }));
            }),
            HomeItem(title: "贪吃蛇", onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GameSnakePage();
              }));
            }),
          ],
        ),
      ),
    );
  }
}
