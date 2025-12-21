import 'package:replay/replay.dart';
import 'package:uno/game/event_sourcing/command_deciders/draw_card_command_decider.dart';
import 'package:uno/game/event_sourcing/command_deciders/play_card_command_decider.dart';
import 'package:uno/game/event_sourcing/command_deciders/start_game_command_decider.dart';
import 'package:uno/game/event_sourcing/event_reducers/card_drawn_event_reducer.dart';
import 'package:uno/game/event_sourcing/event_reducers/card_played_event_reducer.dart';
import 'package:uno/game/event_sourcing/event_reducers/color_mandated_event_reducer.dart';
import 'package:uno/game/event_sourcing/event_reducers/draw_stack_shuffled_event_reducer.dart';
import 'package:uno/game/event_sourcing/event_reducers/game_started_event_reducer.dart';
import 'package:uno/game/event_sourcing/event_reducers/stack_card_played_event_reducer.dart';
import 'package:uno/game/event_sourcing/event_reducers/stack_recycled_event_reducer.dart';
import 'package:uno/game/event_sourcing/event_reducers/turn_ended_event_reducer.dart';
import 'package:uno/game/models/commands/draw_card_command.dart';
import 'package:uno/game/models/commands/play_card_command.dart';
import 'package:uno/game/models/commands/start_game_command.dart';
import 'package:uno/game/models/events/card_drawn_event.dart';
import 'package:uno/game/models/events/card_played_event.dart';
import 'package:uno/game/models/events/color_mandated_event.dart';
import 'package:uno/game/models/events/draw_stack_shuffled_event.dart';
import 'package:uno/game/models/events/game_started_event.dart';
import 'package:uno/game/models/events/stack_card_played_event.dart';
import 'package:uno/game/models/events/stack_recycled_event.dart';
import 'package:uno/game/models/events/turn_ended_event.dart';
import 'package:uno/game/models/game_command.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class Game {
  final Aggregate<GameCommand, GameEvent, GameState> aggregate;

  Game({int? rngSeed, required int playerCount, required int handSize})
    : aggregate = Aggregate(
        initialState: GameState(), // stub, will be replaced by command
        commandDecider: ComposableCommandDecider({
          DrawCardCommand: DrawCardCommandDecider(),
          PlayCardCommand: PlayCardCommandDecider(),
          StartGameCommand: StartGameCommandDecider(),
        }),
        eventReducer: ComposableEventReducer({
          CardDrawnEvent: CardDrawnEventReducer(),
          CardPlayedEvent: CardPlayedEventReducer(),
          ColorMandatedEvent: ColorMandatedEventReducer(),
          DrawStackShuffledEvent: DrawStackShuffledEventReducer(),
          GameStartedEvent: GameStartedEventReducer(),
          StackCardPlayedEvent: StackCardPlayedEventReducer(),
          StackRecycledEvent: StackRecycledEventReducer(),
          TurnEndedEvent: TurnEndedEventReducer(),
        }),
      ) {
    aggregate.process(
      StartGameCommand(
        rngSeed: rngSeed,
        playerCount: playerCount,
        handSize: handSize,
      ),
    );
  }

  void process(GameCommand command) {
    aggregate.process(command);
  }
}
