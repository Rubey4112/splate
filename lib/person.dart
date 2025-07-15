import 'package:flutter/material.dart';

// TODO Implement Draggable
class Person extends StatelessWidget {
  final String name;
  const Person({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 80,
        color: Colors.amber[600],
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.blueGrey,
                      child: Center(child: Text(name))),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          "P1",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
