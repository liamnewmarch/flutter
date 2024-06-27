import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/list.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/item.dart';

class TodosList extends StatelessWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      padding: const EdgeInsets.all(32.0),
      child: Consumer<TodoList>(
        builder: (context, model, child) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final Todo todo = model.todos[index];
              return Dismissible(
                background: Container(color: Colors.redAccent),
                key: todo.key,
                onDismissed: (DismissDirection _) {
                  model.remove(todo);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('To-do deleted')),
                  );
                },
                child: TodoItem(todo, onToggle: ([bool? _]) {
                  model.toggleDone(todo);
                }),
              );
            },
            itemCount: model.todos.length,
          );
        },
      ),
    );
  }
}
