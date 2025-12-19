import 'dart:math';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:replay/replay.dart';
import 'package:uno/game/event_sourcing/command_deciders/game_command_decider.dart';
import 'package:uno/game/models/cards/card_color.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/game/models/cards/numbered_card.dart';
import 'package:uno/game/models/commands/start_game_command.dart';
import 'package:uno/game/models/events/card_drawn_event.dart';
import 'package:uno/game/models/events/draw_stack_shuffled_event.dart';
import 'package:uno/game/models/events/game_started_event.dart';
import 'package:uno/game/models/events/stack_card_played_event.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';
import 'package:uno/game/models/state/player_state.dart';

class StartGameCommandDecider implements GameCommandDecider<StartGameCommand> {
  IList<GameCard> createCards() {
    int cardCount = 0;
    return [
      for (var color in CardColor.values)
        for (var number in List.generate(10, (index) => index))
          NumberedCard(
            id: (cardCount++).toString(),
            color: color,
            number: number,
          ),
    ].toIList();
  }

  @override
  Iterable<GameEvent> decide(StartGameCommand command, GameState state) sync* {
    final cards = createCards();

    final minimumCardCount = command.playerCount * command.handSize + 1;
    if (cards.length < minimumCardCount) {
      throw InvalidCommandException('Not enough cards');
    }

    yield GameStartedEvent(
      initialState: GameState(
        rngSeed: command.rngSeed ?? Random().nextInt(1 << 32),
        drawStack: cards,
        playedStack: <GameCard>[].toIList(),
        players: List.filled(
          command.playerCount,
          PlayerState(hand: <GameCard>[].toIList()),
        ).toIList(),
      ),
    );

    yield DrawStackShuffledEvent();

    for (int i = 0; i < command.handSize; i++) {
      for (int j = 0; j < command.playerCount; j++) {
        yield CardDrawnEvent(playerIndex: j);
      }
    }

    yield StackCardPlayedEvent();
  }
}
