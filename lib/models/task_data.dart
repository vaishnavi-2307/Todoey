import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'tasks.dart';
import 'dart:collection';

// ignore: camel_case_types
class taskData extends ChangeNotifier {
  List<Task> _tasks = [
    //Task(name: 'buy milk'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deletetask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
