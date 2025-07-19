import 'package:flutter/material.dart';

// TODO Implement Draggable
class Person extends StatelessWidget {
  final String name;
  final Color color;
  const Person({required this.name, required this.color, super.key});

  String _usernameIcon() {
    List<String> stringList = name.split(' ');
    return stringList.length > 1
        ? (stringList.first[0] + stringList.last[0]).toUpperCase()
        : stringList.first[0].toUpperCase();
  }

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
                      decoration: ShapeDecoration(
                        color: Colors.blueGrey,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

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
                    _usernameIcon(),
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
