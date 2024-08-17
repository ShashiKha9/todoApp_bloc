part of 'new_todo_bloc.dart';

abstract class NewTodoState extends Equatable {
  const NewTodoState();
}

final class NewTodoInitial extends NewTodoState {
  @override
  List<Object> get props => [];
}
final class NewTodoSucess extends NewTodoState {
  @override
  List<Object> get props => [];
}
final class NewTodoFailure extends NewTodoState {
  @override
  List<Object> get props => [];
}

