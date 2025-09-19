import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/service_locator.dart';
import 'package:to_do_app/todo_list_controller.dart';
import 'package:to_do_app/todo.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  late TextEditingController todoController;
  final controller = getIt<TodoListController>();
  Timer? debouncer;
  bool _isEmpty = false;  // Flag para verificar se o campo está vazio
  bool _showDialog = false;  // Controla se o diálogo deve ser exibido

  @override
  void initState() {
    todoController = TextEditingController(text: widget.todo.task);
    super.initState();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: todoController,
        decoration: const InputDecoration.collapsed(
          hintText: 'Escreva sua tarefa...',
        ),
        onChanged: onChanged, // Chama a função onChanged quando o texto é alterado
        onFieldSubmitted: (_) => onFieldSubmitted(),  // Chama quando "Enter" é pressionado
        onEditingComplete: onEditingComplete,  // Chama quando o campo perde o foco (clicou em outra tarefa)
      ),
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: onToggled,
      ),
      trailing: IconButton(
        onPressed: onDeleted,  // Remove a tarefa quando clicado
        visualDensity: VisualDensity.compact,
        icon: const Icon(Icons.close_rounded),
      ),
    );
  }

  // Função que verifica se o texto foi alterado e faz a atualização ou remoção
  void onChanged(String task) {
    debouncer?.cancel();
    debouncer = Timer(const Duration(milliseconds: 500), () {
      // Atualiza a tarefa
      controller.update(widget.todo.id, task);

      // Se o texto ficou vazio, remove a tarefa ou mostra o aviso
      if (task.isEmpty) {
        setState(() {
          _isEmpty = true;  // Marca o campo como vazio
          _showDialog = true;  // Exibe o diálogo
        });
      }
    });
  }

  void onToggled(_) {
    controller.toggle(widget.todo.id);  // Alterna o status da tarefa
  }

  void onDeleted() {
    controller.remove(widget.todo.id);  // Remove a tarefa manualmente
  }

  // Função chamada quando "Enter" é pressionado (ao submeter a tarefa)
  void onFieldSubmitted() {
    if (todoController.text.isEmpty) {
      _showEmptyTaskDialog();  // Mostra o aviso se a tarefa estiver sem descrição
    } else {
      controller.update(widget.todo.id, todoController.text);  // Atualiza a tarefa
    }
  }

  // Função chamada quando o campo de texto perde o foco (clicou em outra tarefa)
  void onEditingComplete() {
    if (todoController.text.isEmpty) {
      _showEmptyTaskDialog();  // Mostra o aviso se a tarefa estiver sem descrição
    } else {
      controller.update(widget.todo.id, todoController.text);  // Atualiza a tarefa
    }
  }

  // Exibe o alerta quando o texto é apagado
  void _showEmptyTaskDialog() {
    if (_showDialog) {
      showDialog(
        context: context,
        barrierDismissible: false, // O usuário não pode fechar o alerta tocando fora
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Campo vazio'),
            content: const Text('Você tem certeza de que deseja deixar essa tarefa sem descrição?'),
            actions: <Widget>[
              // Botão para excluir a tarefa
              TextButton(
                onPressed: () {
                  controller.remove(widget.todo.id);  // Exclui a tarefa
                  Navigator.of(context).pop();  // Fecha o alerta
                  setState(() {
                    _showDialog = false;  // Fecha o diálogo e limpa o estado
                  });
                },
                child: const Text('Excluir'),
              ),
              // Botão para voltar à edição
              TextButton(
                onPressed: () {
                  setState(() {
                    _isEmpty = false;  // Volta a tarefa para edição
                    _showDialog = false;  // Fecha o diálogo
                  });
                  Navigator.of(context).pop();  // Fecha o alerta
                },
                child: const Text('Voltar a editar'),
              ),
            ],
          );
        },
      );
    }
  }
}
