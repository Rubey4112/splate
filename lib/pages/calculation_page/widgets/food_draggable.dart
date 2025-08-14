import 'package:flutter/material.dart';
import 'package:splate/model/food.dart';

class FoodDraggable extends StatelessWidget {
  final double size = 30;
  final Food food;
  const FoodDraggable({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Draggable<Food>(
      data: food,
      feedback: Material(
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(food.icon, style: TextStyle(fontSize: size)),
        ),
      ),
      dragAnchorStrategy: (draggable, context, position) => Offset(
        draggable.feedbackOffset.dx + size / 2,
        draggable.feedbackOffset.dy + size / 2,
      ),
      childWhenDragging: Container(width: 140, color: Colors.white),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 10, minHeight: 140),
          child: Center(
            child: Text(food.icon, style: TextStyle(fontSize: size)),
          ),
        ),
      ),
    );
  }
}
