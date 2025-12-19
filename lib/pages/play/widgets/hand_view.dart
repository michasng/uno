import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/pages/play/widgets/game_card_view.dart';

class HandView extends StatelessWidget {
  final IList<GameCard> cards;
  final bool isVisible;
  final void Function(GameCard card)? onTapCard;

  const HandView({
    super.key,
    required this.cards,
    required this.isVisible,
    this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        if (onTapCard == null) SizedBox(height: 24),
        if (onTapCard != null)
          Icon(Icons.priority_high_rounded, color: Colors.red),
        SizedBox(
          width: 480,
          child: Wrap(
            spacing: -20,
            alignment: WrapAlignment.center,
            children: [
              for (final card in cards)
                GameCardView.fromGameCard(
                  card,
                  isVisible: isVisible,
                  onTap: () => onTapCard?.call(card),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
