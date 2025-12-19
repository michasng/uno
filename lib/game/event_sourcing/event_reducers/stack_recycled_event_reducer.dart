import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:uno/game/event_sourcing/event_reducers/game_event_reducer.dart';
import 'package:uno/game/models/events/stack_recycled_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class StackRecycledEventReducer
    implements GameEventReducer<StackRecycledEvent> {
  @override
  GameState reduce(StackRecycledEvent event, GameState state) {
    final playedCard = state.playedStack.last;

    return state.copyWith(
      drawStack: state.playedStack.removeLast(),
      playedStack: IList([playedCard]),
    );
  }
}
