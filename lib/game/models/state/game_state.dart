import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/cards/card_color.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/game/models/state/player_state.dart';

part 'game_state.mapper.dart';

@immutable
@MappableClass()
class GameState with GameStateMappable {
  final int rngSeed;
  final IList<GameCard> drawStack;
  final IList<GameCard> playedStack;
  final IList<PlayerState> players;
  final int turnPlayerIndex;
  final bool isClockwise;
  final CardColor? mandatoryColor;

  const GameState({
    this.rngSeed = 0,
    this.drawStack = const IList.empty(),
    this.playedStack = const IList.empty(),
    this.players = const IList.empty(),
    this.turnPlayerIndex = 0,
    this.isClockwise = true,
    this.mandatoryColor,
  });

  PlayerState get turnPlayer => players[turnPlayerIndex];
  int get nextTurnPlayerIndex =>
      (turnPlayerIndex + (isClockwise ? 1 : -1)) % players.length;
}
