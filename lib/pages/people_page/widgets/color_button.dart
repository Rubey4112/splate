import 'package:flutter/material.dart';

/* 
value:
groupValue:
onChanged
 */
class ColorButton extends StatelessWidget {
  final Color color;
  final Color groupColor;
  final ValueChanged<Color> onChanged;

  const ColorButton({
    required this.color,
    required this.groupColor,
    required this.onChanged,
    super.key,
  });

  void _handleTap() {
    onChanged(color);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: color == groupColor
            ? Icon(Icons.check, color: Colors.white, size: 20)
            : null,
      ),
    );
  }
}
