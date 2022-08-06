// class Todos{

//   String todo;
//   bool completed;

//   Todos({required this.todo, this.completed = false});

//   void toggleDone(){
//     completed = !completed;
//   }
// }

class Todos {
  int? _id;
  late String _todo;
  late bool _completed;
  int? _userId;

  Todos({int? id, String? todo, bool? completed, int? userId}) {
    if (id != null) {
      this._id = id;
    }
    if (todo != null) {
      this._todo = todo;
    }
    if (completed != null) {
      this._completed = completed;
    }
    if (userId != null) {
      this._userId = userId;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String get todo => _todo;
  set todo(String? todo) => _todo = todo!;
  bool get completed => _completed;
  set completed(bool? completed) => _completed = completed!;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;

  void toggleDone(){
    completed = !completed;
  }

  Todos.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _todo = json['todo'];
    _completed = json['completed'];
    _userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['todo'] = this._todo;
    data['completed'] = this._completed;
    data['userId'] = this._userId;
    return data;
  }
}