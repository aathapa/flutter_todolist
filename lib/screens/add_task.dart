import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask({this.onPressAddTodo, this.onChangeAddTodo});
  final Function onPressAddTodo;
  final Function onChangeAddTodo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      height: 200.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20.0,
            ),
          ),
          TextField(
            autofocus: true,
            onChanged: onChangeAddTodo,
          ),
          FlatButton(
            child: Text('Add'),
            textColor: Colors.white,
            color: Colors.lightBlueAccent,
            onPressed: onPressAddTodo,
          )
        ],
      ),
    );
  }
}
