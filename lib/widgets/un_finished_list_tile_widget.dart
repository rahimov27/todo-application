import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/app_colors.dart';
import 'package:todo_application/todo_model.dart';

class UnFinishedListTileWidget extends StatelessWidget {
  const UnFinishedListTileWidget({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        formattedDate(todo.date),
        style: TextStyle(
          color: Colors.white60,
          fontFamily: "Gilroy",
          fontSize: 14,
        ),
      ),
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

  String formattedDate(DateTime time) {
    return DateFormat("HH:mm").format(time);
  }
}
