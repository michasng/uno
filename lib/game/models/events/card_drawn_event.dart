import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_event.dart';

part 'card_drawn_event.mapper.dart';

@immutable
@MappableClass()
class CardDrawnEvent with CardDrawnEventMappable implements GameEvent {
  final int playerIndex;
  final bool countsAsTurnDraw;

  const CardDrawnEvent({
    required this.playerIndex,
    required this.countsAsTurnDraw,
  });
}
