import 'package:flutter/material.dart';
import 'package:to_do_app/service_locator.dart';
import 'package:to_do_app/todo_filter.dart';
import 'package:to_do_app/todo_item_widget.dart';
import 'package:to_do_app/todo_list_controller.dart';

class TodoListWidget extends StatelessWidget {
  TodoListWidget({super.key});

  final controller = getIt<TodoListController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.todoListNotifier,
      builder: (context, todoList, child) {
        var isFilterAll = controller.filterNotifier.value == TodoFilter.all;

        if (todoList.isEmpty && !isFilterAll){
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('vazio'),
            ),
          );
        }

        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return TodoItemWidget(key: ValueKey(todo.id), todo: todo);
          }, // ListView.builder
        );
      }, // ValueListenableBuilder
    );
  }
}





