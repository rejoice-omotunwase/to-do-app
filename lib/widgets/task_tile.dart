import 'package:flutter/material.dart';
import 'package:todoey_app/constants.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallBack;
  final Function() longPressCallBack;

  const TaskTile(
      {Key? key,
      required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack,
      required this.longPressCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: kListTextStyle.copyWith(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallBack,
      ),
    );
  }
}
