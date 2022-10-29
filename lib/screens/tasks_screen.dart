import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:todoey_hive/screens/add_task_screen.dart';
import 'package:todoey_hive/widgets/task_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey_hive/models/task_data.dart';
import 'package:todoey_hive/models/boxes.dart';
import 'package:todoey_hive/models/task.dart';
import 'package:todoey_hive/models/task_data.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void dispose() {
    Hive.box('tasks').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // //Receiving value from pop()-> addTaskScreen
          // use provider instead
          // var nameTask = await showModalBottomSheet(
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.zero,
                  bottomLeft: Radius.zero),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ),
          );
          //print(nameTask);
          // //after receiving value form pop()-> addTaskScreen
          //use provider instead
          // setState(() {
          //   tasks.add(Task(name: nameTask));
          // });
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: double.infinity),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 40.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14.0),
              decoration: const BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: ValueListenableBuilder<Box<Task>>(
                  valueListenable: Boxes.getTasks().listenable(),
                  builder: (context, box, _) {
                    final tasks = box.values.toList().cast<Task>();
                    return TaskList(tasks: tasks);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
