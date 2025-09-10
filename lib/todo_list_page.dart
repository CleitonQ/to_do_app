import 'package:flutter/material.dart';
import 'package:to_do_app/new_todo_widget.dart';
import 'package:to_do_app/service_locator.dart';
import 'package:to_do_app/todo_filter.dart';
import 'package:to_do_app/todo_list_controller.dart';
import 'package:to_do_app/todo_list_widget.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final controller = getIt<TodoListController>();
  static const List<Tab> tabs = [
    Tab(text: 'Todas'),
    Tab(text: 'A fazer'),
    Tab(text: 'Concluídas'),
  ];

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('To Do App'),
          centerTitle: true, // Aqui é onde o título é centralizado
          bottom: TabBar(
            tabs: tabs,
            onTap: (index) {
              controller.changeFilter(TodoFilter.values[index]);
            },
          ),
        ), // AppBar
        body: ListView(
          children: [
            // ValueListenableBuilder para exibir NewTodoWidget
            ValueListenableBuilder(
              valueListenable: controller.filterNotifier,
              builder: (context, filter, child) {
                // Mostrar NewTodoWidget apenas quando o filtro for 'Todas' ou 'A fazer'
                if (filter == TodoFilter.completed) {
                  return const SizedBox.shrink(); // Não exibe para tarefas concluídas
                }

                return const NewTodoWidget(); // Exibe o widget de adicionar nova tarefa
              },
            ),
            TodoListWidget(),
          ], // ListView
        ), // Scaffold
      ),
    );
  }
}
