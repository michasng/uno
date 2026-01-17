import 'package:replay/replay.dart';
import 'package:uno/game/event_sourcing/command_deciders/game_command_decider.dart';
import 'package:uno/game/models/commands/pass_turn_command.dart';
import 'package:uno/game/models/events/turn_ended_event.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class PassTurnCommandDecider implements GameCommandDecider<PassTurnCommand> {
  @override
  Iterable<GameEvent> decide(PassTurnCommand command, GameState state) sync* {
    if (state.isGameOver) {
      throw InvalidCommandException('Game is over');
    }

    yield TurnEndedEvent();
  }
}
