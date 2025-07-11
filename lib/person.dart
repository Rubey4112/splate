import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  final String name;
  const Person({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.amber[600],
        child: Center(child: Text(name)),
      ),
    );
  }
}
