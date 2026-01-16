import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/pages/play/widgets/game_card_view.dart';

class PlayedStackView extends StatelessWidget {
  final IList<GameCard> cards;

  const PlayedStackView({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GameCardView.width.toDouble(),
      height: GameCardView.height.toDouble(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          GameCardView.cornerRadius.toDouble(),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 4),
        ],
      ),
      child: cards.isEmpty ? null : GameCardView(cards.last, isVisible: true),
    );
  }
}
