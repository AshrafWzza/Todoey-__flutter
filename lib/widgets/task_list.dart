import 'package:flutter/material.dart';
import 'package:todoey_hive/models/task.dart';
import 'package:todoey_hive/models/task_data.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  const TaskList({Key? key, required this.tasks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(
        child: Text('No Tasks Yet!'),
      );
    }
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 0.5),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0 || index == tasks.length + 1) {
          return Container();
        }
        final currentTask = tasks[index - 1];
        return ListTile(
          onLongPress: () {
            TaskData.deleteTaskHive(currentTask);
          },
          title: Text(
            currentTask.name!,
            style: TextStyle(
              decoration:
                  currentTask.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            value: currentTask.isDone,
            onChanged: (bool? value) {
              TaskData.updateTaskHive(currentTask, value!);
            },
          ),
        );
      },
      itemCount: tasks.length + 2,
    );
  }
}
