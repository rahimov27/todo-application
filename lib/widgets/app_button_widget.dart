import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/app_colors.dart';
import 'package:todo_application/todo_viewmodel.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({super.key, required this.todoController});

  final TextEditingController todoController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(),
      ),
      onPressed: () {
        if (todoController.text.trim().isNotEmpty) {
          Provider.of<TodoViewmodel>(
            context,
            listen: false,
          ).addTodo(todoController.text, false, DateTime.now(), "status");
        }
        todoController.clear();
        Navigator.pop(context);
      },
      child: Text(
        "Done",
        style: TextStyle(fontFamily: "Gilroy", color: AppColors.white),
      ),
    );
  }
}
