import 'package:flutter/material.dart';
import 'package:splate/model/person.dart';

// TODO Implement Draggable
class PersonTile extends StatelessWidget {
  final Person person;

  const PersonTile({required this.person, super.key});

  String _usernameIcon() {
    List<String> stringList = person.name.split(' ');
    return stringList.length > 1
        ? (stringList.first[0] + stringList.last[0]).toUpperCase()
        : stringList.first[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color(0xFFE3E9ED),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: person.color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      _usernameIcon(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '\$${person.totalCost()}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: const Color.fromARGB(255, 215, 223, 230),
                    child: Center(child: Text(person.name)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Color.fromARGB(255, 232, 236, 238),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
