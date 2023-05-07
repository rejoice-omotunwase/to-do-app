import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/constants.dart';
import 'package:todoey_app/models/task_data.dart';

class AddTaskBottomSheet extends StatelessWidget {
  AddTaskBottomSheet({
    Key? key,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: kBorderStyle,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                controller: controller,
                autofocus: true,
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20.0),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = controller.text;
                    Provider.of<TaskData>(context, listen: false).addTask(task);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Add',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/***
 * void
 */
