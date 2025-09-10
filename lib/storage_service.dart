import 'package:to_do_app/todo.dart';

abstract class StorageService {
  Future<List<Todo>> getTodos();
  Future<void> saveTodos(List<Todo> todos);
}