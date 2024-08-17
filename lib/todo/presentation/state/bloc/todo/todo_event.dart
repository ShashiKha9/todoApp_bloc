part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent{
  final String  task;

  const AddTodoEvent({required this.task});

  @override
  // TODO: implement props
  List<Object?> get props => [task];

}

class DeleteTodoEvent extends TodoEvent{
  final String task;

   DeleteTodoEvent( this.task);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CompleteTodoEvent extends TodoEvent{
  final String  task;

  const CompleteTodoEvent({required this.task});

  @override
  // TODO: implement props
  List<Object?> get props => [task];

}

class FilterTodoEvent extends TodoEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

