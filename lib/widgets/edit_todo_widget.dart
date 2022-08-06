import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_data.dart';

class EditingTodoScreen extends StatelessWidget {
  
  EditingTodoScreen(this.task);

  final task;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    String? editedTaskTitle = Provider.of<TodoData>(context).getName(index);

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Change Todo Name to:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,  
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                editedTaskTitle = newText;
              },
            ),
            SizedBox(




              height: 10.0,
            ),
            TextButton(
              child: Text(
                'Change', 
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: (){
                Provider.of<TodoData>(context, listen: false).editTodo(task, editedTaskTitle!);
                Navigator.pop(context);
              },
            ),
          ]),
      ),
    );
  }
}