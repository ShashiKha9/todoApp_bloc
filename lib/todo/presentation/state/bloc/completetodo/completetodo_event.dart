part of 'completetodo_bloc.dart';

abstract class CompleteTodoEvent extends Equatable {
  const CompleteTodoEvent();
}

class MarkCompleteTodoEvent extends CompleteTodoEvent{
  final Todo task;

  MarkCompleteTodoEvent(this.task);
  @override
  // TODO: implement props
  List<Object?> get props => [task];

}
