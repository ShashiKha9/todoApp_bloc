import 'dart:async';

import 'package:todoapp_bloc/todo/data/model/todoModel.dart';
import 'package:hive/hive.dart';

class TodoRepository {
  Box<Todo> todoBox;

  TodoRepository(this.todoBox){
    _streamController.sink.add(todoBox.values.toList());

  }

  final _streamController= StreamController<List<Todo>>.broadcast();

  Stream<List<Todo>> get todoStream => _streamController.stream;




  List<Todo> getTodos() {
    final todos= todoBox.values.toList();
    _streamController.sink.add(todos);
    return todos;
  }

  void addTodo(Todo todo) {
      todoBox.add(todo);
    _streamController.sink.add(todoBox.values.toList());
  }

  void deleteTodo(String  todo)  {
    final todos= todoBox.values.toList();


    final taskDelete=todos.firstWhere((task) => task.title == todo );
    if(taskDelete!=null) {
       todoBox.delete(taskDelete.key);

      _streamController.sink.add(todoBox.values.toList());
    }
  }
  void updateTodo(Todo todo, String oldTitle){
    final todos= todoBox.values.toList();
    
    final taskUpdate = todos.firstWhere((task) => task.title == oldTitle);
      taskUpdate.title = todo.title;

      todoBox.put(taskUpdate.key, taskUpdate);
      _streamController.sink.add(todoBox.values.toList());
      print("newTitle: ${taskUpdate.title}");




  }

  void markComplete(Todo todo){

    final todos= todoBox.values.toList();

    final task= todos.firstWhere((task) => task.title==todo.title);
      task.isCompleted == false?task.isCompleted= true:task.isCompleted=false;
      
      todoBox.put(task.key, task);
    print("todobox: ${task.title}");
    
    print("complete ${todo.isCompleted}");
      _streamController.sink.add(todoBox.values.toList());
      print("shashiss");


  }
  void dispose(){
    _streamController.close();
  }

}