import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/list.dart';

class TodoAddScreen extends StatelessWidget {
  const TodoAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    String newTodoName = '';
    final FocusNode focusNode = FocusNode();
    final TextEditingController controller = TextEditingController();

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Add to-do', style: TextStyle(fontSize: 24.0)),
          Consumer<TodoList>(builder: (context, model, child) {
            return TextField(
              autofocus: true,
              controller: controller,
              decoration: InputDecoration(
                fillColor: theme.colorScheme.onBackground,
                labelText: 'e.g ‘walk the dog’',
              ),
              focusNode: focusNode,
              onChanged: (String value) {
                newTodoName = value;
              },
              onSubmitted: (String _) {
                model.add(newTodoName);
                controller.clear();
                focusNode.requestFocus();
              },
            );
          }),
          const SizedBox(height: 16.0),
          Consumer<TodoList>(
            builder: (context, model, child) {
              return ElevatedButton(
                onPressed: () {
                  model.add(newTodoName);
                  controller.clear();
                },
                style: TextButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Add to-do'),
              );
            },
          ),
        ],
      ),
    );
  }
}
