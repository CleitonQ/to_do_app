import 'package:get_it/get_it.dart';
import 'package:to_do_app/hive_storage.dart';
import 'package:to_do_app/storage_service.dart';
import 'package:to_do_app/todo_list_controller.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<TodoListController>(() => TodoListController());
  getIt.registerLazySingleton<StorageService>(() => HiveStorage());
}
