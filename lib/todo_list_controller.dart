import 'package:flutter/material.dart';
import 'package:to_do_app/todo.dart';
import 'package:to_do_app/todo_filter.dart';
import 'package:to_do_app/todo_list_notifier.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();
  final filterNotifier = ValueNotifier<TodoFilter>(TodoFilter.all);

  // Inicializa o controlador e define o listener para o filtro
  void init() {
    todoListNotifier.init();

    // Quando o filtro mudar, aplica o novo filtro à lista de tarefas
    filterNotifier.addListener(() {
      todoListNotifier.changeFilter(filterNotifier.value);
    });
  }

  // Adiciona uma nova tarefa
  void add(String task) {
    todoListNotifier.add(Todo.create(task));
  }

  // Atualiza o texto de uma tarefa
  void update(String id, String task) {
    todoListNotifier.update(id, task);
  }

  // Alterna o status de conclusão de uma tarefa
  void toggle(String id) {
    todoListNotifier.toggle(id);
  }

  // Remove uma tarefa
  void remove(String id) {
    todoListNotifier.remove(id);
  }

  // Altera o filtro de exibição das tarefas
  void changeFilter(TodoFilter filter) {
    filterNotifier.value = filter;  // Altera o filtro
    // Aplica o filtro imediatamente ao atualizar o todoListNotifier
    todoListNotifier.changeFilter(filter);
  }

  // Reordena as tarefas
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
