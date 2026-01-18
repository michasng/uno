import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/cards/card_color.dart';
import 'package:uno/game/models/cards/colored_card.dart';
import 'package:uno/game/models/cards/game_card.dart';

part 'reverse_card.mapper.dart';

@immutable
@MappableClass()
class ReverseCard with ReverseCardMappable implements GameCard, ColoredCard {
  @override
  final String id;
  @override
  final CardColor color;

  const ReverseCard({required this.id, required this.color});

  @override
  String toString() => 'ReverseCard(id: $id, color: $color)';
}
