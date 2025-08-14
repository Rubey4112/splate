import 'package:flutter/material.dart';
import 'package:splate/model/food.dart';

class FoodsList extends StatelessWidget {
  const FoodsList({super.key, required this.foods});

  final List<Food> foods;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8.0,
      runSpacing: 4.0,
      children: foods.map((food) {
        return CircleAvatar(
          radius: 18,
          child: Text(
            food.icon,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        );
      }).toList(),
    );
  }
}
