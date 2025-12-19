import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/cards/game_card.dart';

part 'player_state.mapper.dart';

@immutable
@MappableClass()
class PlayerState with PlayerStateMappable {
  final IList<GameCard> hand;

  const PlayerState({required this.hand});
}
