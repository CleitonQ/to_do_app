import 'package:flutter/material.dart';
import 'package:to_do_app/service_locator.dart';
import 'package:to_do_app/todo_list_page.dart';

void main() {
  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const TodoListPage(),
    ); // MaterialApp
  }
}
