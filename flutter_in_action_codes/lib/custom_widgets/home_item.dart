
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {

  String title;
  Function onPressed;

  HomeItem({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.all(4),
      child: OutlinedButton(
        onPressed: () {
          onPressed.call();
        },
        child: Text(title),
      ),
    );
  }
}
