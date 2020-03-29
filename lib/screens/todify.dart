import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:todify/models/todo.dart';
import 'add_task.dart';

class Todify extends StatefulWidget {
  @override
  _TodifyState createState() => _TodifyState();
}

class _TodifyState extends State<Todify> {
  String addTodoText;
  @override
  Widget build(BuildContext context) {
    var todoTask = Provider.of<TodoModel>(context);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTask(
                  onChangeAddTodo: (value) => addTodoText = value,
                  onPressAddTodo: () {
                    todoTask
                        .addNewTodo(Item(id: Uuid().v1(), name: addTodoText));
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    maxRadius: 30.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Todify',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 50.0,
                        color: Colors.white),
                  ),
                  Text(
                    '${todoTask.todoList.length} Task',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                ),
                child: TodoList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var todoTask = Provider.of<TodoModel>(context);
    var todoList = todoTask.todoList;
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        var todo = todoList[index];
        print(todo.isDone);
        return TodoListItem(
          text: todo.name,
          isDone: todo.isDone,
          onLongPressListTile: () => todoTask.deleteTodo(index),
          toggleCheckbox: (value) {
            todoTask.updateTask(todo);
          },
        );
      },
    );
  }
}

class TodoListItem extends StatelessWidget {
  TodoListItem({
    this.text,
    this.isDone,
    this.toggleCheckbox,
    this.onLongPressListTile,
  });
  final String text;
  final bool isDone;
  final Function toggleCheckbox;
  final Function onLongPressListTile;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressListTile,
      leading: Text(
        text,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: toggleCheckbox,
      ),
    );
  }
}
