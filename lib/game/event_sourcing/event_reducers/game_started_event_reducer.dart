import 'package:uno/game/event_sourcing/event_reducers/game_event_reducer.dart';
import 'package:uno/game/models/events/game_started_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class GameStartedEventReducer implements GameEventReducer<GameStartedEvent> {
  @override
  GameState reduce(GameStartedEvent event, GameState state) {
    return event.initialState;
  }
}
