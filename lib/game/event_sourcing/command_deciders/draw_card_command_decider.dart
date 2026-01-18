import 'package:replay/replay.dart';
import 'package:uno/game/event_sourcing/command_deciders/game_command_decider.dart';
import 'package:uno/game/models/commands/draw_card_command.dart';
import 'package:uno/game/models/events/card_drawn_event.dart';
import 'package:uno/game/models/events/draw_stack_shuffled_event.dart';
import 'package:uno/game/models/events/stack_recycled_event.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class DrawCardCommandDecider implements GameCommandDecider<DrawCardCommand> {
  @override
  Iterable<GameEvent> decide(DrawCardCommand command, GameState state) sync* {
    if (state.isGameOver) {
      throw InvalidCommandException('Game is over');
    }

    if (state.hasDrawnThisTurn) {
      throw InvalidCommandException('Player already drew this turn');
    }

    if (state.drawStack.isEmpty) {
      if (state.playedStack.length <= 1) {
        throw InvalidCommandException('There are no cards to draw');
      }

      yield StackRecycledEvent();
      yield DrawStackShuffledEvent();
    }

    yield CardDrawnEvent(
      playerIndex: state.turnPlayerIndex,
      countsAsTurnDraw: true,
    );
  }
}
