import 'package:a3/FirstPage.dart';
import 'package:flutter/material.dart';

import 'SecondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FirstPage(),
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
      },
    );
  }
}
