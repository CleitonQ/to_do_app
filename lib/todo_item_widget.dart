import 'package:flutter/material.dart';
import 'package:to_do_app/todo.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  late TextEditingController todoController;

  @override
  void initState() {
    todoController = TextEditingController(text: widget.todo.task);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: todoController,
        decoration: const InputDecoration.collapsed(
          hintText: 'escreva sua tarefa...',
        ), // InputDecoration.collapsed
        onChanged: onChanged,
      ), // TextFormField
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: onToggled,
      ), // Checkbox
      trailing: IconButton(
        onPressed: onDeleted, // Alterado para onDeleted sem parâmetros
        visualDensity: VisualDensity.compact,
        icon: Icon(Icons.close_rounded),
      ), // IconButton
    ); // ListTile
  }

  void onChanged(String task) {
    print(task);
  }

  void onToggled(_) {
    print("Toggled");
  }

  void onDeleted() {
    print('deleted');
  }
}
