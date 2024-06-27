import 'package:flutter/material.dart';

class Todo {
  final Key key = GlobalKey();
  final String name;
  bool done;

  Todo(
    this.name, {
    this.done = false,
  });
}
