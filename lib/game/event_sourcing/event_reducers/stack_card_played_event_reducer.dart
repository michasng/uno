import 'package:uno/game/event_sourcing/event_reducers/game_event_reducer.dart';
import 'package:uno/game/models/events/stack_card_played_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class StackCardPlayedEventReducer
    implements GameEventReducer<StackCardPlayedEvent> {
  @override
  GameState reduce(StackCardPlayedEvent event, GameState state) {
    final card = state.drawStack.last;
    return state.copyWith(
      drawStack: state.drawStack.removeLast(),
      playedStack: state.playedStack.add(card),
    );
  }
}
