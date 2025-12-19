import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_event.dart';

part 'turn_changed_event.mapper.dart';

@immutable
@MappableClass()
class TurnChangedEvent with TurnChangedEventMappable implements GameEvent {
  final int turnPlayerIndex;

  const TurnChangedEvent({required this.turnPlayerIndex});
}
