import 'package:flutter/material.dart';
import 'todo_app.dart';  // 꼭 todo_app.dart를 import 해야 TodoApp 위젯 사용 가능

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoApp(),
    );
  }
}

