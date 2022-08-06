import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:todo_app/screens/todos_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoData(),
      child: MaterialApp(
        home: TodoScreen(),
      ),
    );
  }
}