import 'package:flutter/material.dart';
import 'package:todoey_hive/models/task.dart';
import 'screens/tasks_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
/*
    return FutureBuilder<bool>(
        future: _darkMode,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  darkTheme: ThemeData.dark(),
                  // themeMode: snapshot.data! ? ThemeMode.dark : ThemeMode.light,
                  themeMode: snapshot.data! ? ThemeMode.light : ThemeMode.light,
                  // LIGHT, LIGHT - Change calculation to updateTheme function
                  // Theme mode depends on device settings at the beginning
                  home: TasksScreen(),
                );
              }
          }
        });
*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      // themeMode: xxxxxx ? ThemeMode.dark : ThemeMode.light,
      // problem: when app starts with lightMode, the toggle works fine but doesn't work when starts with darkMode
      // solve: make updateTheme Function using Get.changeTheme(ThemeData.dark())

      themeMode: ThemeMode.light,
      // Theme mode depends on device settings at the beginning
      home: const TasksScreen(),
    );
  }
}
