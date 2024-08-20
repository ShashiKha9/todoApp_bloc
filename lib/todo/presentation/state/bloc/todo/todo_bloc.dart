import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp_bloc/todo/Domain/todos_repositiory.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this.todoRepository) : super(TodoInitial()) {

    on<FilterTodoEvent>(_onFilterTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);



  }

  final TodoRepository todoRepository;

  void _onDeleteTodo(DeleteTodoEvent event, Emitter<TodoState>emit){
    final task=event.task;

    todoRepository.deleteTodo(task);


  }
  //
  void _onFilterTodo(FilterTodoEvent event, Emitter<TodoState> emit) {
    final filtered= todoRepository.getTodos();


    emit(TodoFilteredState(filtered));
  }

  void _onUpdateTodo(UpdateTodoEvent event, Emitter<TodoState>emit){
    final task = event.task;
    todoRepository.updateTodo(task,event.oldTitle);
    emit(TodoFilteredState(todoRepository.getTodos()));


  }

  // void _onCompleteTodo(CompleteTodoEvent event, Emitter<TodoState>emit){
  //   final task= _allTodos.firstWhere((todo) => todo.title==event.task);
  //
  //   task.isCompleted == false?task.isCompleted= true:task.isCompleted=false;
  //   _filterTasksController.sink.add(List.unmodifiable(_allTodos));
  //   emit((TodoCompleteState());
  // //
  //
  // }

}

