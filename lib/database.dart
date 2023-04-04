import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Database {
  List todolist = [];
  final _mybox = Hive.box('mybox');
  void createInitialdata() {
    todolist = [
      ['Make Tutorial', false],
      ['Do Exercise', false],
    ];
  }

  void loaddata() {
    todolist = _mybox.get('Todolist');
  }

  void updatedatabase() {
    _mybox.put('Todolist', todolist);
  }
}
