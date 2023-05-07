import 'package:flutter/material.dart';
import 'package:todoey_app/screens/task_screens.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (BuildContext context) => TaskData(),
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
