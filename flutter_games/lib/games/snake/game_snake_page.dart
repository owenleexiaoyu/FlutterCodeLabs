import 'package:flutter/material.dart';

class GameSnakePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(
        child: Text(
          "敬请期待～",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
