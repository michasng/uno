import 'package:uno/game/event_sourcing/event_reducers/game_event_reducer.dart';
import 'package:uno/game/models/events/card_drawn_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class CardDrawnEventReducer implements GameEventReducer<CardDrawnEvent> {
  @override
  GameState reduce(CardDrawnEvent event, GameState state) {
    final player = state.players[event.playerIndex];

    final drawnCard = state.drawStack.last;
    return state.copyWith(
      drawStack: state.drawStack.removeLast(),
      players: state.players.replace(
        event.playerIndex,
        player.copyWith(hand: player.hand.add(drawnCard)),
      ),
      hasDrawnThisTurn: event.countsAsTurnDraw,
    );
  }
}
