import 'package:flutter/material.dart';
import 'package:to_do_app/service_locator.dart';
import 'package:to_do_app/storage_service.dart';
import 'package:to_do_app/todo.dart';
import 'package:to_do_app/todo_filter.dart';

class TodoListNotifier extends ValueNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  final _allTodosNotifier = ValueNotifier<List<Todo>>([]);
  TodoFilter _currentFilter = TodoFilter.all;
  final _storageService = getIt<StorageService>();

  List<Todo> get _todos => _allTodosNotifier.value;

  // Inicializa o notifier e carrega os todos
  void init() async {
    _allTodosNotifier.value = await _storageService.getTodos();
    _updateTodoList();

    _allTodosNotifier.addListener(() {
      _updateTodoList();
      _saveTodoListToDB();
    });
  }

  // Adiciona uma nova tarefa
  void add(Todo todo) {
    _allTodosNotifier.value = [..._todos, todo];
  }

  // Atualiza uma tarefa existente
  void update(String id, String task) {
    _allTodosNotifier.value = [
      for (final todo in _todos)
        if (todo.id != id) todo else todo.copyWith(task: task)
    ];
  }

  // Alterna o status de uma tarefa (completa/incompleta)
  void toggle(String id) {
    _allTodosNotifier.value = [
      for (final todo in _todos)
        if (todo.id != id) todo else todo.copyWith(completed: !todo.completed)
    ];
  }

  // Remove uma tarefa
  void remove(String id) {
    _allTodosNotifier.value = _todos.where((todo) => todo.id != id).toList();
  }

  // Reordena a lista de tarefas
  void reorder(List<Todo> todos) {
    _allTodosNotifier.value = todos;
  }

  // Altera o filtro
  void changeFilter(TodoFilter filter) {
    _currentFilter = filter;
    _updateTodoList();  // Atualiza a lista de acordo com o novo filtro
  }

  // Atualiza a lista com base no filtro
  void _updateTodoList() {
    value = _mapFilterToTodoList();  // Aplica o filtro nas tarefas
  }

  // Salva a lista de tarefas no banco de dados
  void _saveTodoListToDB() {
    _storageService.saveTodos(_todos.where((todo) => todo.task.isNotEmpty).toList());
  }

  // Mapeia o filtro para as tarefas (concluídas, incompletas, ou todas)
  List<Todo> _mapFilterToTodoList() {
    switch (_currentFilter) {
      case TodoFilter.incomplete:
        return _todos.where((todo) => !todo.completed).toList();
      case TodoFilter.completed:
        return _todos.where((todo) => todo.completed).toList();
      case TodoFilter.all:
      default:
        return _todos;  // Para 'Todas', retorna todas as tarefas
    }
  }
}
