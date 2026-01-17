import 'package:flutter/material.dart';
import 'package:uno/game/models/cards/card_color.dart';
import 'package:uno/game/models/cards/colored.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/game/models/cards/numbered_card.dart';

class GameCardView extends StatelessWidget {
  static const double baseWidth = 2;
  static const double baseHeight = 3;
  static const double baseCornerRadius = 0.3;

  final GameCard card;
  final double scale;
  final bool isVisible;
  final VoidCallback? onTap;

  const GameCardView(
    this.card, {
    super.key,
    required this.scale,
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

    final width = baseWidth * scale;
    final height = baseHeight * scale;
    final cornerRadius = baseCornerRadius * scale;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(cornerRadius),
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: isVisible ? color : Colors.black,
            borderRadius: BorderRadius.circular(cornerRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: width / 16),
              borderRadius: BorderRadius.circular(cornerRadius),
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
      ),
    );
  }
}
