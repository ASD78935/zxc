import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Person.dart';
import 'SecondPage.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: ElevatedButton(
          onPressed: () async {
            final person = Person('홍길동',20);
            final result = await Navigator.pushNamed(
              context,
              '/second',
            );

            print(result);
          },
          child: Text('다음 페이지로')
      ),
    );
  }
}