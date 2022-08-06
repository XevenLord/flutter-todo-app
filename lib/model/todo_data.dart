// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:todo_app/model/todos.dart';
import 'dart:collection';
// import 'package:todo_app/services/networking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';


class TodoData extends ChangeNotifier{
  // List<Todos>? _todos = [
    // Ts(todo: 'Buy milk'),
    // Ts(todo: 'Buy eggs'),
    // Ts(todo: 'Buy bread'),
  // ];
  List<Todos>? _todos = [];
  int? _total;
  int? _skip;
  int? _limit;

  TodoData({List<Todos>? todos, int? total, int? skip, int? limit}) {
    if (todos != null) {
      this._todos = todos;
    }
    if (total != null) {
      this._total = total;
    }
    if (skip != null) {
      this._skip = skip;
    }
    if (limit != null) {
      this._limit = limit;
    }
  }

  List<Todos>? get todos => _todos;
  set todoElement(List<Todos>? todos) => _todos = todos;
  int? get total => _total;
  set total(int? total) => _total = total;
  int? get skip => _skip;
  set skip(int? skip) => _skip = skip;
  int? get limit => _limit;
  set limit(int? limit) => _limit = limit;

  TodoData.fromJson(Map<String, dynamic> json) {
  if (json['todos'] != null) {
    _todos = <Todos>[];
    json['todos'].forEach((v) {
      _todos!.add(new Todos.fromJson(v));
    });
  }
  _total = json['total'];
  _skip = json['skip'];
  _limit = json['limit'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this._todos != null) {
    data['todos'] = this._todos?.map((v) => v.toJson()).toList();
  }
  data['total'] = this._total;
  data['skip'] = this._skip;
  data['limit'] = this._limit;
  return data;
}

  UnmodifiableListView<Todos> get todoElement{
    return UnmodifiableListView<Todos>(_todos!);
  }

  String? getName(int index){
    return _todos?[index].todo;
  }

  int? get todosCount{
    return _todos?.length;
  }

  void addTodo(String newTodoTitle){
    final todo = Todos(todo: newTodoTitle, completed: false);
    _todos?.add(todo);
    notifyListeners();
  }

  void updateCompleted(Todos todo){
    todo.toggleDone();
    notifyListeners();
  }

  void deleteTodo(Todos todo){
    _todos?.remove(todo);
    notifyListeners();
  }

  void editTodo(Todos todo, String editedTodo){
    todo.todo = editedTodo;
    notifyListeners();
  }

  void deleteAll(){
    if(todosCount!=0){
      _todos?.clear();
      notifyListeners();
    }else{
      NullThrownError();
    }
  }

Future<void> getData() async {
    Response response = await Dio().get('https://dummyjson.com/todos/user/1?limit=5');
    if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    
    TodoData todoData = TodoData.fromJson(response.data);
    _todos = todoData._todos;
    _total = todoData._total;
    _skip = todoData._skip;
    _limit = todoData._limit;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load tododata');
  }
  notifyListeners();
}


  // Future<TodoData> getTodoData() async {
  //   NetworkHelper networkHelper = NetworkHelper('https://dummyjson.com/todos/user/1?limit=5');

  //   TodoData todoData = await networkHelper.getData();
  //   print(todoData);
  //   return todoData;
  // }
}