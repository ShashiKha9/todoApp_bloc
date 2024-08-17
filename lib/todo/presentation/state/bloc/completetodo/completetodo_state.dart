part of 'completetodo_bloc.dart';

sealed class CompleteTodoState extends Equatable {
  const CompleteTodoState();
}

final class CompleteTodoInitial extends CompleteTodoState {
  @override
  List<Object> get props => [];
}
final class CompleteTodoSucess extends CompleteTodoState {
  @override
  List<Object> get props => [];
}

