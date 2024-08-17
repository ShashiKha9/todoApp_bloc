import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_bloc/todo/data/model/todoModel.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/blocexports.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/newtodo/new_todo_bloc.dart';
import 'package:todoapp_bloc/todo/presentation/state/bloc/todo/todo_bloc.dart';

class DialogNewTodo extends StatelessWidget {
  DialogNewTodo({
    super.key,
    required this.titleController,
    required this.focusNode,
  });

  final TextEditingController titleController;
  final FocusNode focusNode;


  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<NewTodoBloc>();

        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            title: Column(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      )
                    ],
                    color: Colors.white,

                  ),
                  child: const Icon(Icons.note_alt_outlined,
                      color: Color.fromARGB(255, 143, 128, 128)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("New task", style: GoogleFonts.roboto(
                      fontSize: 23,
                      color: const Color.fromARGB(255, 143, 122, 122),
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: 80,
              child: TextField(
                controller: titleController,
                focusNode: focusNode,
                maxLines: null,
                expands: true,
                style: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 128, 124, 124),
                ),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  hintText: 'What are you planning?',
                  hintStyle: GoogleFonts.roboto(
                    color: const Color(0xff9C9A9A),
                  ),
                ),


              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(onPressed: () {
                var todo = Todo(title: titleController.text);
                // context.read<AddTodoBloc>().add(AddTodoEvent(task: todo));
                taskBloc.add(AddNewTodoEvent(todo));


                print(titleController.text);
                Navigator.pop(context);
                titleController.clear();
              },
                  child: Text('Create',
                    style: GoogleFonts.roboto(fontSize: 15),))
            ],

          ),



    );
  }
}