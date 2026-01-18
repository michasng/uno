import 'package:uno/game/event_sourcing/event_reducers/game_event_reducer.dart';
import 'package:uno/game/models/cards/colored_card.dart';
import 'package:uno/game/models/cards/numbered_card.dart';
import 'package:uno/game/models/cards/reverse_card.dart';
import 'package:uno/game/models/events/card_played_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class CardPlayedEventReducer implements GameEventReducer<CardPlayedEvent> {
  @override
  GameState reduce(CardPlayedEvent event, GameState state) {
    final player = state.players[event.playerIndex];
    final card = player.hand[event.cardIndex];

    return state.copyWith(
      playedStack: state.playedStack.add(card),
      players: state.players.replace(
        event.playerIndex,
        player.copyWith(hand: player.hand.removeAt(event.cardIndex)),
      ),
      mandatoryColor: card is ColoredCard ? card.color : null,
      mandatoryNumber: card is NumberedCard ? card.number : null,
      isClockwise: card is ReverseCard ? !state.isClockwise : state.isClockwise,
    );
  }
}
