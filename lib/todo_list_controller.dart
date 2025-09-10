import 'package:flutter/material.dart';
import 'package:to_do_app/todo.dart';
import 'package:to_do_app/todo_filter.dart';
import 'package:to_do_app/todo_list_notifier.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();
  final filterNotifier = ValueNotifier<TodoFilter>(TodoFilter.all);

  void init() {
    todoListNotifier.init();
    filterNotifier.addListener(() {
      // Chama a função de filtragem sempre que o filtro for alterado
      todoListNotifier.changeFilter(filterNotifier.value);
    });
  }

  void add(String task) {
    todoListNotifier.add(Todo.create(task));
  }

  void update(String id, String task) {
    todoListNotifier.update(id, task);
  }

  void toggle(String id) {
    todoListNotifier.toggle(id);
  }

  void remove(String id) {
    todoListNotifier.remove(id);
  }

  void changeFilter(TodoFilter filter) {
    filterNotifier.value = filter; // Muda o filtro
    // Agora o filtro é imediatamente aplicado
    todoListNotifier.changeFilter(filter);
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final todos = todoListNotifier.value;
    final todo = todos.removeAt(oldIndex);
    todos.insert(newIndex, todo);

    todoListNotifier.reorder(todos);
  }
}
