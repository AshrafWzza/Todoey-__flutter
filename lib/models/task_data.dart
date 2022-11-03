//You should separate task.dart and taskData.dart because if you make it one file it make error crash app
//"this error happens when you try to create and read provider immediately"
import 'package:todoey_hive/models/boxes.dart';
import 'package:todoey_hive/models/task.dart';

class TaskData {
  static void addTaskHive(String name) {
    final task = Task(name: name);
    final box = Boxes.getTasks();
    box.add(task);

    /// Auto Generate key
    /// or customize it --> box.put('myKey',task);

    /// final box = Boxes.getTasks();
    /// final myTask = box.get('myKey');
    /// box.values;
    /// box.keys;
  }

  static void updateTaskHive(Task taskwantedtochange, bool value) {
    taskwantedtochange.isDone = value;

    /// save() from extends HiveObject instead of box.put(task.key,task)
    /// task.key --> add key as property to your model
    taskwantedtochange.save();
  }

  static void deleteTaskHive(Task taskwantedtodelete) {
    /// save() from extends HiveObject instead of box.remove(task.key)
    /// task.key --> add key as property to your model
    taskwantedtodelete.delete();
  }
}
