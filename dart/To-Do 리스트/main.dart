import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'todo.dart'; // 추가한 todo.dart 파일 임포트

void main() async {
  await Hive.initFlutter();  // Hive 초기화
  await Hive.openBox('todoBox'); // Hive Box 열기
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 목록',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoDatabase _todoDatabase = TodoDatabase(); // TodoDatabase 인스턴스
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _todoDatabase.openBox(); // 앱 시작 시 데이터베이스 열기
  }

  void _addTodoItem() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      final todoItem = TodoItem(task: text);
      _todoDatabase.addTodoItem(todoItem);
      setState(() {});
      _controller.clear();
    }
  }

  void _removeTodoItem(int index) {
    _todoDatabase.removeTodoItem(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('할 일 목록'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: '할 일을 입력하세요',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTodoItem,  // 버튼 클릭 시 항목 추가
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box('todoBox').listenable(),
              builder: (context, Box box, _) {
                final todoItems = _todoDatabase.getTodos(); // 할 일 목록 가져오기
                return ListView.builder(
                  itemCount: todoItems.length,
                  itemBuilder: (context, index) {
                    final todo = todoItems[index];
                    return ListTile(
                      title: Text(todo.task),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeTodoItem(index),  // 항목 삭제
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
