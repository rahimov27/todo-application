import 'package:flutter/material.dart';
import 'package:todo_application/app_colors.dart';
import 'package:todo_application/todo_model.dart';

class UnFinishedListTileWidget extends StatelessWidget {
  const UnFinishedListTileWidget({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.name,
        style: TextStyle(
          color: AppColors.white,
          fontFamily: "Gilroy",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
