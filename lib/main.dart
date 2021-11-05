import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_app/screens/task_screen.dart';
import 'package:todo_app/models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => taskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
