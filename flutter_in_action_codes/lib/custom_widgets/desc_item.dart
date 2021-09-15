
import 'package:flutter/material.dart';

/// 展示一些提示信息
class DescItem extends StatelessWidget {

  String title;
  DescItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.symmetric(vertical: 4),
      color: Colors.orange,
      child: Row(
        children: [
          Icon(Icons.arrow_right, color: Colors.white,),
          Text(title, style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
