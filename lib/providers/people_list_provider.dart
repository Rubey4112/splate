import 'package:flutter/material.dart';
import 'package:splate/person.dart';

class PeopleListProvider extends ChangeNotifier {
  final List _persons = <Person>[];

  int get length => _persons.length;

  Person getPerson(int index) {
    return _persons[index];
  }

  void add(Person person) {
    _persons.add(person);
    notifyListeners();
  }

  void removeAt(int index) {
    _persons.removeAt(index);
    notifyListeners();
  }
}
