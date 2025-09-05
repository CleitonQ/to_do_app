import 'package:flutter/material.dart';
import 'package:to_do_app/todo_list_widget.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key,});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('To Do App'),
      ), // AppBar
      body: ListView(
        children: [
          //TODO: widget para a nova tarefa
          TodoListWidget(),
        ],
      )
    ); // Scaffold
  }
}