import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoList extends ChangeNotifier {
  final List<Todo> _todos = [];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void add(String name) {
    _todos.add(Todo(name));
    notifyListeners();
  }

  void clearDone() {
    _todos.removeWhere((todo) => todo.done);
    notifyListeners();
  }

  void remove(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void toggleDone(Todo todo) {
    todo.done = !todo.done;
    notifyListeners();
  }
}
