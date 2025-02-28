import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  List<String> backgroudImages = [
    "assets/wallpaper.jpg",
    "assets/wallpaper-2.jpg",
    "assets/wallpaper-3.jpg",
    "assets/wallpaper-4.jpg",
  ];

  String backgroundImage = "assets/wallpaper.jpg";

  Future<void> setBackgroundImage(String imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("wallpaper", imagePath);
    setState(() {
      backgroundImage = imagePath;
    });
  }

  Future<void> loadBackgroundImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedImage = await prefs.getString("wallpaper");
    if (savedImage != null) {
      setState(() {
        backgroundImage = savedImage;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadBackgroundImage();
  }

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoViewmodel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AppBackgroundWidget(image: backgroundImage),
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
      floatingActionButton: SpeedDial(
        overlayColor: Colors.black,
        shape: CircleBorder(),
        overlayOpacity: 0,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.white,
        spacing: 10,
        spaceBetweenChildren: 5,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            shape: CircleBorder(),
            onTap:
                () => showDialog(
                  context: context,
                  builder:
                      (context) =>
                          AppDialogWidget(todoController: todoController),
                ),
          ),
          SpeedDialChild(
            child: Icon(Icons.wallpaper),
            shape: CircleBorder(),
            onTap:
                () => showModalBottomSheet(
                  context: context,
                  sheetAnimationStyle: AnimationStyle(curve: Curves.easeIn),
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  useSafeArea: true,
                  builder:
                      (_) => SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                backgroudImages.map((image) {
                                  return GestureDetector(
                                    onTap: () {
                                      setBackgroundImage(image);
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          image,
                                          fit: BoxFit.cover,
                                          height: 60,
                                          width: 60,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                ),
          ),
        ],
      ),
    );
  }
}
