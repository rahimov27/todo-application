import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/app_colors.dart';
import 'package:todo_application/widgets/app_button_widget.dart';
import 'package:todo_application/widgets/app_text_field_widget.dart';

class AppDialogWidget extends StatefulWidget {
  const AppDialogWidget({super.key, required this.todoController});

  final TextEditingController todoController;

  @override
  State<AppDialogWidget> createState() => _AppDialogWidgetState();
}

class _AppDialogWidgetState extends State<AppDialogWidget> {
  DateTime selectedDate = DateTime.now();
  bool isMain = false;
  @override
  Widget build(BuildContext context) {
    DateFormat('dd.MM-HH:mm').format(selectedDate);
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      iconPadding: EdgeInsets.all(0),
      backgroundColor: Colors.white,
      content: Container(
        decoration: BoxDecoration(color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextFieldWidget(todoController: widget.todoController),
              SizedBox(height: 10),
              GestureDetector(
                child: Text(formatedDate(selectedDate)),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder:
                        (_) => Container(
                          height: 250,
                          color: AppColors.white,
                          child: CupertinoDatePicker(
                            use24hFormat: true,
                            mode: CupertinoDatePickerMode.dateAndTime,
                            onDateTimeChanged: (value) {
                              setState(() {
                                selectedDate = value;
                              });
                            },
                          ),
                        ),
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Важно?",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CupertinoSwitch(
                    value: isMain,
                    onChanged: (value) {
                      setState(() {
                        isMain = !isMain;
                        print(isMain);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: AppButtonWidget(
                  todoController: widget.todoController,
                  selectedTime: selectedDate,
                  isMain: isMain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatedDate(DateTime date) {
    return DateFormat('dd.MM-HH:mm').format(date);
  }
}
