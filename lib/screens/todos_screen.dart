// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todos_list.dart';
import 'package:todo_app/screens/add_todo_screen.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/alert_delete_all.dart';
// import 'package:todo_app/services/networking.dart';

class TodoScreen extends StatefulWidget{
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  
  // _getTodoData() async{
  //   TodoData todoData = Provider.of<TodoData>(context, listen: false);
  //   TodoData response = NetworkHelper(url)
  // }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoData>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red.shade400,
            child: Icon(Icons.delete),
            onPressed: (){
               showAlertDialog(context);                    
            },
          ),
          FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add),
            onPressed: (){
              showModalBottomSheet(
                context: context, 
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTodoScreen(),
                  )
                )
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
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
                  radius: 30.0,
                  ),
                SizedBox(



                  height: 10.0,
                ),
                Text('Todoapp',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  )
                ),
                Text(
                  'Total - ${Provider.of<TodoData>(context).todosCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    )
                ),
                child: TodosList(),
              ),
            ),
        ],
      ),
    );
  }
}