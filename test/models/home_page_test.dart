import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/todo/Domain/todos_repositiory.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/todo/todo_bloc.dart';
import '../../lib/todo/data/model/todoModel.dart';
import '../../lib/todo/presentation/pages/homepage.dart';

void main() async {
  final todobox = await Hive.openBox<Todo>('todo');
  testWidgets('HomePage Widget Test', (WidgetTester tester) async {
    // Initialize the TodoRepository
    final todoRepository = TodoRepository(todobox);

    // Provide TodoBloc to the HomePage
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<TodoRepository>.value(value: todoRepository),
          BlocProvider<TodoBloc>(
            create: (context) => TodoBloc(todoRepository),
          ),
        ],
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    // Verify if the AppBar title is displayed
    expect(find.text('ToDos'), findsOneWidget);

    // Verify the initial state message
    expect(find.text('Enter your first todo'), findsOneWidget);

    // Simulate adding a todo
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Enter text in the dialog
    await tester.enterText(find.byType(TextField), 'Test Todo');
    await tester.tap(find.text('Add')); // Adjust if necessary
    await tester.pumpAndSettle();

    // Verify the todo is added
    expect(find.text('Test Todo'), findsOneWidget);

    // Navigate through tabs and check the state
    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    expect(find.text('No Completed Todos'), findsOneWidget);

    await tester.tap(find.text('Pending'));
    await tester.pumpAndSettle();
    expect(find.text('Test Todo'), findsOneWidget);
  });
}
