import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/blocexports.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/completetodo/completetodo_bloc.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/todo/todo_bloc.dart';
import 'package:todoapp_bloc/todo/presentation/widgets/dialog_newtodo.dart';


class TaskList extends StatelessWidget {
  TaskList({
    super.key,
    required this.todoList,
  });



  List<Todo> todoList = [];


  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final FocusNode focusNode = FocusNode();
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

                  trailing:SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              showDialog(
                                  context: context, builder: (context) {
                                return DialogNewTodo(
                                  titleController: titleController,
                                  focusNode: focusNode,
                                existingTodo: task);
                              });

                            },
                            child: Icon(Icons.edit,)
                        ),
                        InkWell(
                            onTap: () {
                              todoBloc.add(DeleteTodoEvent(task.title));
                            },
                            child: Icon(Icons.cancel_rounded, color: Colors.red,)
                        ),



                      ],
                    ),
                  )

              );
            },


          );


  }
}
