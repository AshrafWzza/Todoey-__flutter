import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:todoey_hive/models/task.dart';

class Boxes {
  static Box<Task> getTasks() => Hive.box<Task>('tasks');
}
