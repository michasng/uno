import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/pages/play/widgets/game_card_view.dart';

class DrawStackView extends StatelessWidget {
  final IList<GameCard> cards;
  final VoidCallback? onTap;

  const DrawStackView({super.key, required this.cards, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        GameCardView.cornerRadius.toDouble(),
      ),
      child: Ink(
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
        child: cards.isEmpty
            ? Container()
            : GameCardView(cards.last, isVisible: false, onTap: onTap),
      ),
    );
  }
}
