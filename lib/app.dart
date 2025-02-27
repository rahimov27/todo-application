import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/todo_viewmodel.dart';
import 'package:todo_application/widgets/app_background_widget.dart';
import 'package:todo_application/widgets/app_dialog_widget.dart';
import 'package:todo_application/widgets/finished_list_tile_w_idget.dart';
import 'package:todo_application/widgets/no_todo_text_w_idget.dart';
import 'package:todo_application/widgets/un_finished_list_tile_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoViewmodel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AppBackgroundWidget(),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                todoModel.todos.isEmpty
                    ? NoTodoTextWidget()
                    : Expanded(
                      child: ListView.builder(
                        itemCount: todoModel.todos.length,
                        itemBuilder: (context, index) {
                          final todo = todoModel.todos[index];
                          return Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.60,
                                child:
                                    todo.isFinished
                                        ? FinishedListTileWidget(todo: todo)
                                        : UnFinishedListTileWidget(todo: todo),
                              ),
                              Spacer(),
                              Checkbox(
                                activeColor: Colors.black,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                value: todo.isFinished,
                                onChanged: (value) async {
                                  todoModel.toggle(index);
                                  await Future.delayed(
                                    Duration(seconds: 4),
                                    () {
                                      todoModel.removeTodo(todo);
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AppDialogWidget(todoController: todoController),
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
