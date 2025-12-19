import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';

part 'game_started_event.mapper.dart';

@immutable
@MappableClass()
class GameStartedEvent with GameStartedEventMappable implements GameEvent {
  final GameState initialState;

  const GameStartedEvent({required this.initialState});
}
