import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/blocexports.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/completetodo/completetodo_bloc.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/todo/todo_bloc.dart';


class TaskList extends StatelessWidget {
  TaskList({
    super.key,
    required this.todoList
  });

  List<Todo> todoList = [];


  @override
  Widget build(BuildContext context) {
    final completeTodoBloc = context.read<CompleteTodoBloc>();
    final todoBloc = context.read<TodoBloc>();


    return


           ListView.builder(

            itemCount: todoList.length,
            itemBuilder: (context, index) {
              final task = todoList[index];

              return ListTile(
                  title: Text(task.title),
                  leading:
                  Checkbox(
                    value: task.isCompleted == false?true:false,
                    onChanged: (value) {
                      completeTodoBloc.add(MarkCompleteTodoEvent(task));
                      print(task.isCompleted);
                      print("eewrw");
                    },


                  ),

                  trailing:
                  InkWell(
                      onTap: () {


                        todoBloc.add(DeleteTodoEvent(task.title));



                        // context.read<DeleteTodoBloc>().add(
                        //     DeleteTodoEvent(task: todo));
                        // print(todo.title);
                        //
                        //
                        //   // final updatedTasks= context.read<DeleteTodoBloc>().state.allTodos;
                        //
                        //   // context.read<AddTodoBloc>().add(
                        //   //     UpdateTodosEvent(updatedTodos: updatedTasks, task:todo));
                        //   print("deleted");
                        //   // print(updatedTasks.length);
                        //
                        //
                        //
                        //


                      },
                      child: Icon(Icons.cancel_rounded, color: Colors.red,)
                  )
              );
            },


          );


  }
}
