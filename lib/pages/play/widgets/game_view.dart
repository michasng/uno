import 'package:flutter/material.dart';
import 'package:uno/game/game.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/game/models/commands/draw_card_command.dart';
import 'package:uno/game/models/commands/play_card_command.dart';
import 'package:uno/game/models/state/game_state.dart';
import 'package:uno/pages/play/widgets/draw_stack_view.dart';
import 'package:uno/pages/play/widgets/hand_view.dart';
import 'package:uno/pages/play/widgets/played_stack_view.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late final Game game;

  GameState get gameState => game.aggregate.currentState;

  void onTapDrawStack() {
    setState(() {
      game.process(DrawCardCommand());
    });
  }

  void onTapCard(GameCard card, int playerIndex) {
    final cardIndex = gameState.players[playerIndex].hand.indexOf(card);

    setState(() {
      game.process(PlayCardCommand(cardIndex: cardIndex));
    });
  }

  @override
  void initState() {
    super.initState();

    game = Game(playerCount: 4, handSize: 7);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildHandView(2),
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildHandView(1),
            PlayedStackView(cards: gameState.playedStack),
            DrawStackView(
              cards: gameState.drawStack,
              onTap: gameState.isGameOver ? null : onTapDrawStack,
            ),
            buildHandView(3),
          ],
        ),
        buildHandView(0),
      ],
    );
  }

  Widget buildHandView(int playerIndex) {
    return HandView(
      cards: gameState.players[playerIndex].hand,
      isVisible: true,
      onTapCard:
          gameState.isGameOver || gameState.turnPlayerIndex != playerIndex
          ? null
          : (card) => onTapCard(card, playerIndex),
    );
  }
}
