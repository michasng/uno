import 'package:flutter/material.dart';
import 'package:uno/game/models/cards/card_color.dart';
import 'package:uno/game/models/cards/colored.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/game/models/cards/numbered_card.dart';

class GameCardView extends StatelessWidget {
  static const int width = 64;
  static const int height = 96;
  static const int cornerRadius = 8;

  final GameCard card;
  final bool isVisible;
  final VoidCallback? onTap;

  const GameCardView(
    this.card, {
    super.key,
    required this.isVisible,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = this.card; // to enable type-narrowing
    final color = card is ColoredCard
        ? switch (card.color) {
            CardColor.red => Colors.red,
            CardColor.blue => Colors.blue,
            CardColor.green => Colors.green,
            CardColor.yellow => Colors.yellow,
          }
        : Colors.black;
    final label = card is NumberedCard
        ? card.number.toString()
        : card.runtimeType.toString();

    return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      decoration: BoxDecoration(
        color: isVisible ? color : Colors.black,
        borderRadius: BorderRadius.circular(cornerRadius.toDouble()),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: width / 16),
            borderRadius: BorderRadius.circular(cornerRadius.toDouble()),
          ),
          child: Text(
            isVisible ? label : '?',
            style: TextStyle(
              color: Colors.white,
              fontSize: width / 2,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(color: Colors.black, blurRadius: width / 8)],
            ),
          ),
        ),
      ),
    );
  }
}
