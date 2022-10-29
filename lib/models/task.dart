//You should separate task.dart and taskData.dart because if you make it one file it make error crash app
//"this error happens when you try to create and read provider immediately"
import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  bool isDone;

  Task({this.name, this.isDone = false});

  // void toggleDone() {
  //   isDone = !isDone;
  // }

}
