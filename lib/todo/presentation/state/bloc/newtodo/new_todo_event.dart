part of 'new_todo_bloc.dart';

sealed class NewTodoEvent extends Equatable {
  const NewTodoEvent();
}

class AddNewTodoEvent extends NewTodoEvent{
  @override

  final Todo task;
  AddNewTodoEvent(this.task);
  // TODO: implement props
  List<Object?> get props => [task];

}
