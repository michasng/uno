import 'package:flutter/material.dart';

class TurnIndicator extends StatelessWidget {
  final int turnPlayerIndex;

  const TurnIndicator({super.key, required this.turnPlayerIndex});

  IconData get _arrow => switch (turnPlayerIndex) {
    0 => Icons.keyboard_arrow_down_rounded,
    1 => Icons.keyboard_arrow_left_rounded,
    2 => Icons.keyboard_arrow_up_rounded,
    3 => Icons.keyboard_arrow_right_rounded,
    _ => throw UnsupportedError('Only 4 players are supported'),
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(_arrow, size: 32, color: Colors.white),
        Text(
          'PLAYER ${turnPlayerIndex + 1}\'S TURN',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        Icon(_arrow, size: 32, color: Colors.white),
      ],
    );
  }
}
