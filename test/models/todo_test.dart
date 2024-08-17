import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp_bloc/todo/Domain/todos_repositiory.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';

import '../../lib/todo/presentation/state/bloc/todo/todo_bloc.dart';

void main() {
  group('TodoBloc', () {
    late TodoBloc todoBloc;
    late TodoRepository todoRepository;

    setUp(() {
      todoRepository = TodoRepository();
      todoBloc = TodoBloc(todoRepository);
    });

    tearDown(() {
      todoBloc.close();
      todoRepository.dispose();
    });

    test('initial state is TodoInitial', () {
      expect(todoBloc.state, equals(TodoInitial()));
    });

    blocTest<TodoBloc, TodoState>(
      'emits [TodoFilteredState] with todos when FilterTodoEvent is added',
      build: () {
        todoRepository.addTodo(Todo(
          title: 'Test Task 1',
          isCompleted: false,
        ));
        todoRepository.addTodo(Todo(
          title: 'Test Task 2',
          isCompleted: true,
        ));
        return todoBloc;
      },
      act: (bloc) => bloc.add(FilterTodoEvent()),
      expect: () => [
        TodoFilteredState([
          Todo(
            title: 'Test Task 1',
            isCompleted: false,
          ),
          Todo(
            title: 'Test Task 2',
            isCompleted: true,
          ),
        ]),
      ],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [TodoFilteredState] when a todo is deleted',
      build: () {
        todoRepository.addTodo(Todo(
          title: 'Test Task 1',
          isCompleted: false,
        ));
        todoRepository.addTodo(Todo(
          title: 'Test Task 2',
          isCompleted: true,
        ));
        return todoBloc;
      },
      act: (bloc) {
        bloc.add(DeleteTodoEvent('Test Task 1'));
        bloc.add(FilterTodoEvent());
      },
      expect: () => [
        TodoFilteredState([
          Todo(
            title: 'Test Task 2',
            isCompleted: true,
          ),
        ]),
      ],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [TodoFilteredState] when a todo is marked as complete',
      build: () {
        todoRepository.addTodo(Todo(
          title: 'Test Task 1',
          isCompleted: false,
        ));
        return todoBloc;
      },
      act: (bloc) {
        todoRepository.markComplete(Todo(
          title: 'Test Task 1',
          isCompleted: false,
        ));
        bloc.add(FilterTodoEvent());
      },
      expect: () => [
        TodoFilteredState([
          Todo(
            title: 'Test Task 1',
            isCompleted: true,
          ),
        ]),
      ],
    );
  });
}
