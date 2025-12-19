import 'package:uno/game/event_sourcing/event_reducers/game_event_reducer.dart';
import 'package:uno/game/models/events/turn_changed_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class TurnChangedEventReducer implements GameEventReducer<TurnChangedEvent> {
  @override
  GameState reduce(TurnChangedEvent event, GameState state) {
    return state.copyWith(turnPlayerIndex: event.turnPlayerIndex);
  }
}
