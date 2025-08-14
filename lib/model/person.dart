import 'package:flutter/material.dart';
import 'package:splate/model/food.dart';

class Person {
  final String name;
  final Color color;
  final List<Food> foods;

  Person({required this.name, required this.color, List<Food>? foods})
    : foods = foods ?? [];

  double totalCost() {
    return foods.fold(0, (sum, food) => sum + food.cost);
  }
}
