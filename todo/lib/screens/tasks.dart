import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/list.dart';
import 'package:todo/screens/add.dart';
import 'package:todo/widgets/header.dart';
import 'package:todo/widgets/list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TodoHeader(
              color: theme.colorScheme.onPrimaryContainer,
            ),
            const Expanded(
              child: TodosList(),
            ),
            Container(
              color: theme.canvasColor,
              padding: const EdgeInsets.all(16.0),
              child: Consumer<TodoList>(
                builder: (context, model, child) {
                  final count = model.todos.where((todo) {
                    return todo.done;
                  }).length;
                  return TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: () {
                      if (count > 0) {
                        model.clearDone();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(count == 1
                                ? 'Deleted 1 to-do'
                                : 'Deleted $count to-dos'),
                          ),
                        );
                      }
                    },
                    child: Text('Clear done ($count)'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        onPressed: () {
          showModalBottomSheet(
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const TodoAddScreen(),
                ),
              );
            },
            context: context,
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add, size: 32.0),
      ),
    );
  }
}
