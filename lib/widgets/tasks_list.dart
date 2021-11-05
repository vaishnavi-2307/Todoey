import 'package:flutter/material.dart';
import 'package:todo_app/models/task_data.dart';
//import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<taskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "DELETE",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                taskData.deletetask(task);
                Scaffold.of(context)
                    // ignore: deprecated_member_use
                    .showSnackBar(SnackBar(content: Text("Item deleted")));
              },
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkBoxCallBack: (checkboxState) {
                  taskData.updateTask(task);
                },
                //longPressCallBack: ,
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
