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

              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color:   task.isCompleted==false ?Colors.lightGreen.shade400:
                    Colors.lightBlue.shade200,width: 2.0),
                    boxShadow: [
                BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
              ]
              ),
                  child: ListTile(





                   

                      title: Text(task.title,style: GoogleFonts.roboto(fontWeight: FontWeight.w400),),
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
                                child: Icon(Icons.cancel_rounded, color: Colors.red[500],)
                            ),



                          ],
                        ),
                      )

                  ),

              );
            },


          );


  }
}
