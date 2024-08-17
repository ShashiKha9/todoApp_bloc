import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/blocexports.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/newtodo/new_todo_bloc.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/todo/todo_bloc.dart';
import 'package:todoapp_bloc/todo/presentation/widgets/task_list.dart';
import 'package:todoapp_bloc/todo/presentation/widgets/dialog_newtodo.dart';
import 'package:todoapp_bloc/todo/presentation/widgets/bottom_navbar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  bool isChecked = false;
  final titleController = TextEditingController();

  void _onTabSelected(int index){
    setState(() {
      currentTab=index;
    });

  }


  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    final todoBloc = context.read<TodoBloc>();
    final todoBlocs = context.read<NewTodoBloc>();


    // print("Todo list length: ${todoList.length}");
                return Scaffold(
                    floatingActionButtonLocation: FloatingActionButtonLocation
                        .centerDocked,
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      shape: const CircleBorder(),
                      onPressed: () {
                        showDialog(
                            context: context, builder: (context) {
                          return DialogNewTodo(
                            titleController: titleController,
                            focusNode: focusNode,);
                        });
                      },
                      child: const Icon(Icons.add, color: Colors.white70,),

                    ),
                    bottomNavigationBar: BottomNavBar(
                        currentTab: currentTab,onTabSelected: _onTabSelected,),


                    appBar: AppBar(
                      title: const Text("ToDos"),
                    ),
                    body:
    StreamBuilder<List<Todo>>(
    stream: todoBloc.todoRepository.todoStream,
    builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {

      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: Text("Enter your first todo"),);
      }
      if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      }

        if (snapshot.hasData) {
          final todoList=snapshot.data!;
          List<Todo> filteredList;

          if (currentTab == 0) {
    return TaskList(todoList: todoList);
    } else if (currentTab == 1) {
            filteredList=todoList.where((todo) => todo.isCompleted==false).toList();

            return filteredList.isEmpty ? Center(child: Text("No Completed Todos")):TaskList(
    todoList: filteredList,
    );
    } else if (currentTab == 2) {
            filteredList=todoList.where((todo) => todo.isCompleted==true  || todo.isCompleted==null).toList();

    return filteredList.isEmpty? Center(child:Text("No Pending Todos")):
      TaskList(
    todoList: filteredList
    );
    } else {
    return Center(
    child: Text("No view for this tab"),
    );
    }
    }

    return Center(child: Text("Enter your first todo"),);




    }




                )






    );
  }
}





