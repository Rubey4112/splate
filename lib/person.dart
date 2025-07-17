import 'package:flutter/material.dart';

// TODO Implement Draggable
class Person extends StatelessWidget {
  final String name;
  final Color color;
  const Person({required this.name, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 80,
        color: Colors.blueGrey,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.blueGrey,
                      child: Center(child: Text(name)),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: Text('data'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    "P1",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
