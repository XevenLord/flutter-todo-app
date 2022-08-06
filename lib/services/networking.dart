import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_app/model/todo_data.dart';


class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<TodoData> getData() async {
      http.Response response = await http.get(Uri.parse('https://dummyjson.com/todos/user/1?limit=5'));
      if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      
      return TodoData.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load tododata');
    }
  }
}