import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todify/models/todo.dart';
import 'package:todify/screens/todify.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todify',
        home: Todify(),
      ),
    );
  }
}
