import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp_bloc/todo/Domain/todos_repositiory.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/completetodo/completetodo_bloc.dart';

part 'completetodo_event.dart';
part 'completetodo_state.dart';

class CompleteTodoBloc extends Bloc<CompleteTodoEvent, CompleteTodoState> {
  CompleteTodoBloc(this.todoRepository) : super(CompleteTodoInitial()) {
    on<MarkCompleteTodoEvent>(_markCompleteTodo) ;
      // TODO: implement event handler

  }
final TodoRepository todoRepository;
  void  _markCompleteTodo(MarkCompleteTodoEvent event, Emitter<CompleteTodoState> emit){
    todoRepository.markComplete(event.task);
    emit(CompleteTodoSucess());


  }
}
