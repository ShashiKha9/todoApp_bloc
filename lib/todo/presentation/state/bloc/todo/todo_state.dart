part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final Stream<List<Todo>>? filteredtask;
  const TodoState(  this.filteredtask);

}


final class TodoInitial extends TodoState {

  const TodoInitial() : super(null);

  @override
  // TODO: implement props
  List<Object?> get props => [];




}


// class TodoAddedState extends TodoState {
//   final Todo newTask;
//   const TodoAddedState({required this.newTask});
//
//   @override
//   List<Object> get props => [newTask];
// }
// class TodoDeletedState extends TodoState {
//   const TodoDeletedState(super.filteredtask);
//
//   @override
//   List<Object> get props => [];
// }

class TodoFilteredState extends TodoState {
  const TodoFilteredState( super.filteredtask);

  @override
  List<Object> get props => [];
}

class TodoCompleteState extends TodoState {
  final Todo  task;
  const TodoCompleteState(super.filteredtask, this.task);

  @override
  List<Object> get props => [];
}
//

