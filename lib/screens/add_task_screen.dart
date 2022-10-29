import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_hive/models/boxes.dart';
import 'package:todoey_hive/models/task.dart';
import 'package:todoey_hive/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  void addTaskHive(String name) {
    final task = Task(name: name);
    final box = Boxes.getTasks();
    box.add(task);

    /// Auto Generate key
    /// or customize it --> box.put('myKey',task);
  }

  void updateTask(Task taskwantedtochange, bool value) {
    taskwantedtochange.isDone = value;

    /// save() from extends HiveObject instead of box.put(key,task)
    taskwantedtochange.save();
  }

  void deleteTask(Task taskwantedtodelete) {
    /// save() from extends HiveObject instead of box.remove(task.key)

    taskwantedtodelete.delete();
  }

  @override
  Widget build(BuildContext context) {
    String? nameTask;
    return Column(
      children: [
        const Text(
          'Add Task',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.w500,
            color: Colors.lightBlueAccent,
          ),
        ),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            filled: true,
            hintText: 'Add new task',
          ),
          // use provider instead
          onChanged: (value) {
            nameTask = value;
          },
          //onChanged: (newText) => context.read<Task>().add(newText),
        ),
        TextButton(
          onPressed: () {
            TaskData.addTaskHive(
                nameTask!); // listen: false  Mandatory or will not update list,
            Navigator.pop(context);
          },
          child: const Text(
            'Add',
            style: TextStyle(),
          ),
          style: TextButton.styleFrom(
            //Chane textButton Colors
            primary: Colors.white,
            backgroundColor: Colors.lightBlueAccent,
          ),
        ),
      ],
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_hive/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? nameTask;
    return Column(
      children: [
        const Text(
          'Add Task',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.w500,
            color: Colors.lightBlueAccent,
          ),
        ),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            filled: true,
            hintText: 'Add new task',
          ),
          // use provider instead
          onChanged: (value) {
            nameTask = value;
          },
          //onChanged: (newText) => context.read<Task>().add(newText),
        ),
        TextButton(
          onPressed: () {
            //use provider instead
            //Navigator.pop(context, nameTask); //Passing value Backward
            Provider.of<TaskData>(context, listen: false).add(
                nameTask!); // listen: false  Mandatory or will not update list,
            // and must call it by method add() contains notifyListeners();which update all listeners -> cant just say .name=newTask
            Navigator.pop(context);
          },
          child: const Text(
            'Add',
            style: TextStyle(),
          ),
          style: TextButton.styleFrom(
            //Chane textButton Colors
            primary: Colors.white,
            backgroundColor: Colors.lightBlueAccent,
          ),
        ),
      ],
    );
  }
}
*/
