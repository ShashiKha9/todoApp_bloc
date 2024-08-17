import 'dart:async';

import 'package:todoapp_bloc/todo/data/model/todoModel.dart';

class TodoRepository {
  List<Todo> _todos = [];

  final _streamController= StreamController<List<Todo>>.broadcast();

  Stream<List<Todo>> get todoStream => _streamController.stream;


  List<Todo> getTodos() {
    _streamController.sink.add(_todos);
    return _todos;
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    _streamController.sink.add(_todos);
  }

  void deleteTodo(String  todo) {
    _todos.removeWhere((task) => task.title == todo);
    _streamController.sink.add(_todos);


  }

  void markComplete(Todo todo){
    final index=_todos.indexOf(todo);
      final task= _todos.firstWhere((task) => task.title==todo.title);
      task.isCompleted == false?task.isCompleted= true:task.isCompleted=false;


      print("complete ${todo.isCompleted}");
      _streamController.sink.add(_todos);
      print("shashiss");


  }
  void dispose(){
    _streamController.close();
  }

}