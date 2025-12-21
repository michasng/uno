import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_event.dart';

part 'turn_ended_event.mapper.dart';

@immutable
@MappableClass()
class TurnEndedEvent with TurnEndedEventMappable implements GameEvent {
  const TurnEndedEvent();
}
