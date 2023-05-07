import 'package:flutter/foundation.dart';
import 'package:todoey_app/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _defaulttasks = [];

  int get taskCount {
    return _defaulttasks.length;
  }

  UnmodifiableListView<Task> get defaulttasks =>
      UnmodifiableListView(_defaulttasks);

  void addTask(String taskName) {
    final newTask = Task(name: taskName);
    _defaulttasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _defaulttasks.remove(task);
    notifyListeners();
  }
}
