import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  const Keypad({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: FixedColumnWidth(70),
      children: [
        TableRow(children: [_buildKey('1'), _buildKey('2'), _buildKey('3')]),
        TableRow(children: [_buildKey('4'), _buildKey('5'), _buildKey('6')]),
        TableRow(children: [_buildKey('7'), _buildKey('8'), _buildKey('9')]),
        TableRow(children: [_buildKey(''), _buildKey('0'), _buildKey('C')]),
      ],
    );
  }

  Widget _buildKey(String label) {
    return GestureDetector(
      onTap: () {
        // Handle key press
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(label, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
