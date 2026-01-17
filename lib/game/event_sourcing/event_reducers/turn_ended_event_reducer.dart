import 'package:uno/game/event_sourcing/event_reducers/game_event_reducer.dart';
import 'package:uno/game/models/events/turn_ended_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class TurnEndedEventReducer implements GameEventReducer<TurnEndedEvent> {
  @override
  GameState reduce(TurnEndedEvent event, GameState state) {
    if (state.players.where((player) => player.hand.isNotEmpty).length < 2) {
      return state.copyWith(isGameOver: true);
    }

    int sign = state.isClockwise ? 1 : -1;
    int? nextTurnPlayerIndex;
    for (int i = 1; i < state.players.length; i++) {
      final playerIndex =
          (state.turnPlayerIndex + (sign * i)) % state.players.length;
      if (state.players[playerIndex].hand.isNotEmpty) {
        nextTurnPlayerIndex = playerIndex;
        break;
      }
    }

    return state.copyWith(
      turnPlayerIndex: nextTurnPlayerIndex,
      hasDrawnThisTurn: false,
    );
  }
}
