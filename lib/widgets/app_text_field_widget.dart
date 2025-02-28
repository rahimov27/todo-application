import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({super.key, required this.todoController});

  final TextEditingController todoController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontFamily: "Gilroy"),
      cursorColor: Colors.black,
      controller: todoController,
      decoration: InputDecoration(
        hintText: "Введите задачу",
        hintStyle: TextStyle(fontFamily: "Gilroy"),
        focusColor: Colors.black,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
