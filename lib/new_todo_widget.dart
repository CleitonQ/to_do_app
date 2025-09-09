import 'package:flutter/material.dart';
import 'package:to_do_app/service_locator.dart';
import 'package:to_do_app/todo_list_controller.dart';

class NewTodoWidget extends StatefulWidget {
  const NewTodoWidget({super.key});

  @override
  State<NewTodoWidget> createState() => _NewTodoWidgetState();
}

class _NewTodoWidgetState extends State<NewTodoWidget> {
  late TextEditingController todoController = TextEditingController();
  final controller = getIt<TodoListController>();
  final todoNode = FocusNode();
  final formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Form(
        key: formKey,
        child: TextFormField(
          focusNode: todoNode,
          controller: todoController,
          decoration: const InputDecoration.collapsed(
            hintText: 'escreva uma nova tarefa...',
          ), // InputDecoration.collapsed
          validator: (v){
            if (v == null || v.isEmpty){
              return 'Não pode ser vazio';
            }
            return null;
          },
          onFieldSubmitted: (_) => onSubmitted(),
        ),
      ), // TextFormField
      leading: const Checkbox(
        value: false,
        onChanged: null,
      ), // Checkbox
      trailing: TextButton(
        onPressed: onSubmitted,
        child: const Text('Salvar'),
      ),
    ); // ListTile
  }

  void onSubmitted() {
   if (!formKey.currentState!.validate()) return;

    controller.add(todoController.text);
    formKey.currentState!.reset();

    todoNode.unfocus();
  }
}
