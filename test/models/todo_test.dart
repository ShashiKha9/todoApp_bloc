import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todoapp_bloc/todo/Domain/todos_repositiory.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';

import '../../lib/todo/Domain/todos_repositiory.dart';
import '../../lib/todo/presentation/state/bloc/todo/todo_bloc.dart';

// Create a mock for the TodoRepository
class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  group('TodoBloc', () {
    late MockTodoRepository mockTodoRepository;
    late TodoBloc todoBloc;

    setUp(() {
      mockTodoRepository = MockTodoRepository();
      todoBloc = TodoBloc(mockTodoRepository);
    });

    tearDown(() {
      todoBloc.close();
    });

    blocTest<TodoBloc, TodoState>(
      'emits [TodoFilteredState] when FilterTodoEvent is added',
      build: () {
        when(mockTodoRepository.getTodos()).thenReturn([Todo(
          title: 'Test Task',
          isCompleted: false,
        )] as Stream<List<Todo>>);
        return todoBloc;
      },
      act: (bloc) => bloc.add(FilterTodoEvent()),
      expect: () => [
        isA<TodoFilteredState>(),
      ],
      verify: (_) {
        verify(mockTodoRepository.getTodos()).called(1);
      },
    );

    blocTest<TodoBloc, TodoState>(
      'emits nothing when DeleteTodoEvent is added',
      build: () {
        final task = Todo(
          title: 'Test Task',
          isCompleted: false,
        );
        when(mockTodoRepository.deleteTodo(task.title)).thenAnswer((_) async => {});
        return todoBloc;
      },
      act: (bloc) => bloc.add(DeleteTodoEvent()),
      expect: () => [],
      verify: (_) {
        verify(mockTodoRepository.deleteTodo(any)).called(1);
      },
    );
  });
}
