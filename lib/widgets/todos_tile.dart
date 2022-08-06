// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodosTile extends StatelessWidget {
  final bool isCompleted;
  final String? todoTitle;
  final Function(bool?) checkboxCallback;
  final Function()? longPressCallback;
  final Function()? onTapCallback;
  

  TodosTile(
      {required this.isCompleted,
      required this.todoTitle,
      required this.checkboxCallback,
      this.longPressCallback,
      this.onTapCallback,
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todoTitle!,
        style: TextStyle(
          decoration: isCompleted == true ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(




        activeColor: Colors.lightBlueAccent,
        value: isCompleted,
        onChanged: checkboxCallback,
      ),
      onLongPress: longPressCallback,
      onTap: onTapCallback, // I think here replace with text field and with display text functions
    );
  }
}