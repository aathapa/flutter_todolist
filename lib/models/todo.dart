import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TodoModel extends ChangeNotifier {
  List<Item> _todoList = [];

  List<Item> getTodoList() => _todoList;

  void addNewTodo(Item item) {
    _todoList.add(item);
    notifyListeners();
  }

  List<Item> get todoList => _todoList;

  void updateTask(Item task) {
    task.toggleIsDone();
    notifyListeners();
  }

  void deleteTodo(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }
}

class Item {
  Item({this.id, this.name, this.isDone = false, this.createdAt});
  final String id;
  final String name;
  bool isDone;
  final DateTime createdAt;

  void toggleIsDone() {
    isDone = !isDone;
  }
}
