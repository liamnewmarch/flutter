import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/list.dart';
import 'package:todo/screens/tasks.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TodoList(),
      child: MaterialApp(
        home: const TasksScreen(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: Colors.lightBlueAccent,
          ).copyWith(
            primary: Colors.lightBlueAccent,
            primaryContainer: Colors.lightBlueAccent,
            onPrimaryContainer: Colors.white,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Colors.lightBlueAccent,
          ).copyWith(
            primary: Colors.lightBlueAccent,
            onPrimaryContainer: Colors.lightBlueAccent,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
