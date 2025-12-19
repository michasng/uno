import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_event.dart';

part 'card_played_event.mapper.dart';

@immutable
@MappableClass()
class CardPlayedEvent with CardPlayedEventMappable implements GameEvent {
  final int playerIndex;
  final int cardIndex;

  const CardPlayedEvent({required this.playerIndex, required this.cardIndex});
}
