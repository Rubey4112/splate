import 'package:flutter/material.dart';
import 'person.dart';

void main() {
  runApp(SplateApp());
}

class SplateApp extends StatelessWidget {
  const SplateApp({super.key});

  static const List _persons = [
    'person 1',
    'person 2',
    'person 3',
    'person 4',
    'person 5',
    'person 6',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _persons.length,
                itemBuilder: (context, index) => Person(name: _persons[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
