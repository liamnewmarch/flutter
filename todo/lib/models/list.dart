import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/utils/storage.dart';

class TodoList extends ChangeNotifier {
  final List<Todo> _todos = [];
  final JsonStorage _storage = JsonStorage(key: 'todo', defaultValue: '[]');

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  TodoList() {
    _load();
  }

  void _load() async {
    _todos.clear();
    final data = await _storage.read();
    if (data is Iterable) {
      for (final item in data) {
        try {
          _todos.add(Todo.fromJson(item));
        } catch (error) {
          print('Error parsing Todo from JSON: $error');
        }
      }
    }
    notifyListeners();
  }

  void _save() async {
    await _storage.write(_todos);
    notifyListeners();
  }

  void add(String name) {
    _todos.add(Todo(name));
    _save();
  }

  void clearDone() {
    _todos.removeWhere((todo) => todo.done);
    _save();
  }

  void remove(Todo todo) {
    _todos.remove(todo);
    _save();
  }

  void toggleDone(Todo todo) {
    todo.done = !todo.done;
    _save();
  }
}
