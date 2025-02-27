import 'package:flutter/material.dart';

class NoTodoTextWidget extends StatelessWidget {
  const NoTodoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "На сегодня нету задач!",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Gilroy",
          fontSize: 23,
        ),
      ),
    );
  }
}
