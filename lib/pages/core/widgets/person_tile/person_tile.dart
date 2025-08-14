import 'package:flutter/material.dart';

import 'package:splate/model/person.dart';
import 'package:splate/pages/core/widgets/person_tile/widgets/foods_list.dart';

// TODO Implement Draggable
class PersonTile extends StatelessWidget {
  final Person person;

  const PersonTile({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: const Color(0xFFE3E9ED),
      child: Row(
        children: [
          Column(
            children: [
              PersonIcon(person: person),
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(person.name),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Color.fromARGB(255, 232, 236, 238),
                    child: FoodsList(foods: person.foods),
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

class PersonIcon extends StatelessWidget {
  const PersonIcon({super.key, required this.person});

  final Person person;

  String _usernameIcon() {
    List<String> stringList = person.name.split(' ');
    return stringList.length > 1
        ? (stringList.first[0] + stringList.last[0]).toUpperCase()
        : stringList.first[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 32,
        backgroundColor: person.color,
        child: Text(
          _usernameIcon(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
      ),
    );
  }
}
