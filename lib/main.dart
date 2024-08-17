import 'package:flutter/material.dart';
import 'package:todoapp_bloc/todo/Domain/todos_repositiory.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';
import 'package:todoapp_bloc/todo/presentation/pages/homepage.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/blocexports.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/completetodo/completetodo_bloc.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/newtodo/new_todo_bloc.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/todo/todo_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final todoRepository = TodoRepository();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=> TodoBloc(todoRepository)..add(FilterTodoEvent()),lazy: false,),
        BlocProvider(create: (context)=> NewTodoBloc(todoRepository)),
        BlocProvider(create: (context)=> CompleteTodoBloc(todoRepository)),



      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ToDoApp",
        home: HomePage(),
      ),
    );
  }
}
