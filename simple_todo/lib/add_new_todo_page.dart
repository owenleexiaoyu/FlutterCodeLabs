
import 'package:flutter/material.dart';

class AddNewTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a TODO"),
      ),
      body: TextField(

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {

        },
      ),
    );
  }
}
