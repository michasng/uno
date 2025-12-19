import 'dart:math';

import 'package:uno/game/event_sourcing/event_reducers/game_event_reducer.dart';
import 'package:uno/game/models/events/draw_stack_shuffled_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class DrawStackShuffledEventReducer
    implements GameEventReducer<DrawStackShuffledEvent> {
  @override
  GameState reduce(DrawStackShuffledEvent event, GameState state) {
    final random = Random(state.rngSeed);

    return state.copyWith(
      rngSeed: random.nextInt(1 << 32),
      drawStack: state.drawStack.shuffle(random),
    );
  }
}
