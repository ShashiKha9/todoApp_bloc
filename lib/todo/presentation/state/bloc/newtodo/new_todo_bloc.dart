import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp_bloc/todo/Domain/todos_repositiory.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';

part 'new_todo_event.dart';
part 'new_todo_state.dart';

class NewTodoBloc extends Bloc<NewTodoEvent, NewTodoState> {
  NewTodoBloc(this.todoRepository) : super(NewTodoInitial()) {
    on<AddNewTodoEvent>(_addTodo);

  }
  final TodoRepository todoRepository;
  void _addTodo(AddNewTodoEvent event, Emitter<NewTodoState> state){
    final newTask = event.task;
    todoRepository.addTodo(newTask);
    emit(NewTodoSucess());



  }
}
