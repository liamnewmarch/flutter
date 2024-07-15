import 'package:flutter/material.dart';

class Todo {
  final Key key = GlobalKey();
  final String name;
  bool done = false;

  Todo.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        done = json['done'] as bool;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'done': done,
    };
  }

  Todo(this.name);
}
