import 'package:uno/game/event_sourcing/command_deciders/game_command_decider.dart';
import 'package:uno/game/models/commands/draw_card_command.dart';
import 'package:uno/game/models/events/card_drawn_event.dart';
import 'package:uno/game/models/events/draw_stack_shuffled_event.dart';
import 'package:uno/game/models/events/stack_recycled_event.dart';
import 'package:uno/game/models/events/turn_changed_event.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class DrawCardCommandDecider implements GameCommandDecider<DrawCardCommand> {
  @override
  Iterable<GameEvent> decide(DrawCardCommand command, GameState state) sync* {
    if (state.drawStack.isEmpty) {
      if (state.playedStack.length <= 1) {
        // can't draw, but no error
        yield TurnChangedEvent(turnPlayerIndex: state.nextTurnPlayerIndex);
        return;
      }

      yield StackRecycledEvent();
      yield DrawStackShuffledEvent();
    }

    yield CardDrawnEvent(playerIndex: state.turnPlayerIndex);
    yield TurnChangedEvent(turnPlayerIndex: state.nextTurnPlayerIndex);
  }
}
