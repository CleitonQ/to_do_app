class Todo {
  final String task;
  final bool completed;

  Todo({required this.task, required this.completed});

  factory Todo.create(String task) {
    return Todo(task: task, completed: false);
  }
}
