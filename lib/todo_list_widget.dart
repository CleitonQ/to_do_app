import 'package:flutter/material.dart';

class  TodoListWidget extends StatelessWidget {
  const TodoListWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Task 1'),
        )
      ]
    );
  }
}

