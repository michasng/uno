import 'package:replay/replay.dart';
import 'package:uno/game/event_sourcing/command_deciders/game_command_decider.dart';
import 'package:uno/game/models/commands/play_card_command.dart';
import 'package:uno/game/models/events/card_played_event.dart';
import 'package:uno/game/models/events/turn_ended_event.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class PlayCardCommandDecider implements GameCommandDecider<PlayCardCommand> {
  @override
  Iterable<GameEvent> decide(PlayCardCommand command, GameState state) sync* {
    if (state.isGameOver) {
      throw InvalidCommandException('Game is over');
    }

    if (command.cardIndex >= state.turnPlayer.hand.length) {
      throw InvalidCommandException("Card doesn't exist");
    }

    final card = state.turnPlayer.hand[command.cardIndex];
    if (!state.canPlay(card)) {
      throw InvalidCommandException('Cannot play $card');
    }

    yield CardPlayedEvent(
      playerIndex: state.turnPlayerIndex,
      cardIndex: command.cardIndex,
    );

    yield TurnEndedEvent();
  }
}
