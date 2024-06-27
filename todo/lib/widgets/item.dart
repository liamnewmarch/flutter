import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final void Function([bool?])? onToggle;

  const TodoItem(
    this.todo, {
    this.onToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        todo.name,
        style: TextStyle(
          decoration:
              todo.done ? TextDecoration.lineThrough : TextDecoration.none,
          fontSize: 14.0,
        ),
      ),
      trailing: Checkbox(
        activeColor: theme.colorScheme.primary,
        onChanged: onToggle,
        value: todo.done,
      ),
      onTap: onToggle,
    );
  }
}
