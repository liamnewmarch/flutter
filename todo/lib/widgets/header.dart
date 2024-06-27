import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/list.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<TodoList>(
            builder: (context, model, child) {
              return CircleAvatar(
                backgroundColor: theme.colorScheme.onPrimaryContainer,
                foregroundColor: theme.colorScheme.primaryContainer,
                radius: 24.0,
                child: const Icon(Icons.check, size: 24.0),
              );
            },
          ),
          const SizedBox(height: 8.0),
          Text(
            'To-do',
            style: TextStyle(
              color: theme.colorScheme.onPrimaryContainer,
              fontSize: 32.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Consumer<TodoList>(
            builder: (context, model, child) {
              return Text(
                '${model.todos.length} tasks',
                style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
              );
            },
          ),
        ],
      ),
    );
  }
}
