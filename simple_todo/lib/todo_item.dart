
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (value) {

          }),
          Text("A todo text")
        ],
      ),
    );
  }
}
