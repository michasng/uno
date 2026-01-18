import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/cards/card_color.dart';
import 'package:uno/game/models/cards/colored_card.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/game/models/cards/numbered_card.dart';
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
  final bool hasDrawnThisTurn;
  final bool isClockwise;
  final CardColor? mandatoryColor;
  final int? mandatoryNumber;
  final bool isGameOver;

  const GameState({
    this.rngSeed = 0,
    this.drawStack = const IList.empty(),
    this.playedStack = const IList.empty(),
    this.players = const IList.empty(),
    this.turnPlayerIndex = 0,
    this.hasDrawnThisTurn = false,
    this.isClockwise = true,
    this.mandatoryColor,
    this.mandatoryNumber,
    this.isGameOver = false,
  });

  PlayerState get turnPlayer => players[turnPlayerIndex];

  bool canPlay(GameCard card) =>
      (mandatoryColor == null && mandatoryNumber == null) ||
      (mandatoryColor != null &&
          card is ColoredCard &&
          card.color == mandatoryColor) ||
      (mandatoryNumber != null &&
          card is NumberedCard &&
          card.number == mandatoryNumber);
}
