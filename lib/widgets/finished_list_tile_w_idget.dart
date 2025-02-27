import 'package:flutter/material.dart';
import 'package:todo_application/app_colors.dart';
import 'package:todo_application/todo_model.dart';

class FinishedListTileWidget extends StatelessWidget {
  const FinishedListTileWidget({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.name,
        style: TextStyle(
          fontFamily: "Gilroy",
          color: AppColors.white,
          decoration: TextDecoration.lineThrough,
        ),
      ),
    );
  }
}
