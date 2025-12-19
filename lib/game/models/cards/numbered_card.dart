import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/cards/card_color.dart';
import 'package:uno/game/models/cards/colored.dart';
import 'package:uno/game/models/cards/game_card.dart';

part 'numbered_card.mapper.dart';

@immutable
@MappableClass()
class NumberedCard with NumberedCardMappable implements GameCard, ColoredCard {
  @override
  final String id;
  @override
  final CardColor color;
  final int number;

  const NumberedCard({
    required this.id,
    required this.color,
    required this.number,
  });

  @override
  bool canBePlayedOn(GameCard other, {CardColor? mandatoryColor}) {
    if (mandatoryColor != null && color != mandatoryColor) return false;

    if (other is NumberedCard) {
      return other.color == color || other.number == number;
    }

    if (other is ColoredCard) {
      return other.color == color;
    }

    return true;
  }

  @override
  String toString() =>
      'NumberedUnoCard(id: $id, color: $color, number: $number)';
}
