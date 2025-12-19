import 'package:replay/replay.dart';
import 'package:uno/game/event_sourcing/command_deciders/game_command_decider.dart';
import 'package:uno/game/models/commands/play_card_command.dart';
import 'package:uno/game/models/events/card_played_event.dart';
import 'package:uno/game/models/events/turn_changed_event.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class PlayCardCommandDecider implements GameCommandDecider<PlayCardCommand> {
  @override
  Iterable<GameEvent> decide(PlayCardCommand command, GameState state) sync* {
    if (command.cardIndex >= state.turnPlayer.hand.length) {
      throw InvalidCommandException("Card doesn't exist");
    }

    final cardToPlay = state.turnPlayer.hand[command.cardIndex];
    final playedOnCard = state.playedStack.last;
    if (!cardToPlay.canBePlayedOn(playedOnCard)) {
      throw InvalidCommandException(
        "Card $cardToPlay can't be played on $playedOnCard",
      );
    }

    yield CardPlayedEvent(
      playerIndex: state.turnPlayerIndex,
      cardIndex: command.cardIndex,
    );

    yield TurnChangedEvent(turnPlayerIndex: state.nextTurnPlayerIndex);
  }
}
