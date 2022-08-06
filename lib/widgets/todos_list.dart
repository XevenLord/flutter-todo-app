import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todos_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:todo_app/widgets/edit_todo_widget.dart';

class TodosList extends StatelessWidget {
  // String editTaskCallback(){
  //   return
  // }
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(
      builder:(context, todoData, child){
        return ListView.builder(itemBuilder: (context, index){
          final todo = todoData.todoElement[index];
          return TodosTile(
            todoTitle: todo.todo,  //widget refers to StatefulWidget
            isCompleted: todo.completed,
            checkboxCallback:  (checkboxState){
              todoData.updateCompleted(todo);
            },
            longPressCallback: (){
              todoData.deleteTodo(todo);
            },
            onTapCallback: (){
              showModalBottomSheet(
                context: context, 
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: EditingTodoScreen(todo),
                  )
                )
              );
            },
          );
        },
        itemCount: todoData.todosCount,
        );
      }, 
    );
  }
}