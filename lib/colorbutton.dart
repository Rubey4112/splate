import 'package:flutter/material.dart';

/* 
value:
groupValue:
onChanged
 */
class ColorButton extends StatelessWidget {
  final Color color;

  const ColorButton({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => 0,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
