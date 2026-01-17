import 'package:flutter/material.dart';
import 'package:uno/game/game.dart';
import 'package:uno/game/models/cards/game_card.dart';
import 'package:uno/game/models/commands/draw_card_command.dart';
import 'package:uno/game/models/commands/play_card_command.dart';
import 'package:uno/game/models/state/game_state.dart';
import 'package:uno/pages/play/widgets/game_card_view.dart';
import 'package:uno/pages/play/widgets/turn_indicator.dart';

class GameView extends StatefulWidget {
  final Duration animationDuration;

  const GameView({
    super.key,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late final Game game;

  GameState get gameState => game.aggregate.currentState;

  @override
  void initState() {
    super.initState();

    game = Game(playerCount: 4, handSize: 7);
  }

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

  Alignment _determineCardAlignment({
    required int playerIndex,
    required int handSize,
    required int cardIndex,
  }) {
    final offset = handSize <= 1
        ? 0.0
        : -0.7 + (cardIndex * (1.4 / (handSize - 1)));
    return switch (playerIndex) {
      0 => Alignment(offset, 1),
      1 => Alignment(-1, offset),
      2 => Alignment(offset, -1),
      3 => Alignment(1, offset),
      _ => throw UnsupportedError('Only 4 players are supported'),
    };
  }

  @override
  Widget build(BuildContext context) {
    final drawStackAlignment = Alignment(0.22, 0.0);
    final playedStackAlignment = Alignment(-drawStackAlignment.x, 0.0);

    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final cardScale = constraints.maxWidth / GameCardView.baseWidth / 16;

          return Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TurnIndicator(turnPlayerIndex: gameState.turnPlayerIndex),
                    SizedBox(height: 2.0 * GameCardView.baseHeight * cardScale),
                  ],
                ),
              ),

              if (gameState.drawStack.isNotEmpty)
                _buildCard(
                  gameState.drawStack.last,
                  drawStackAlignment,
                  turns: 0,
                  isVisible: false,
                  cardScale: cardScale,
                  onTap: onTapDrawStack,
                ),
              if (gameState.drawStack.isEmpty)
                Align(
                  alignment: drawStackAlignment,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      GameCardView.baseCornerRadius * cardScale,
                    ),
                    onTap: onTapDrawStack,
                    child: Container(
                      width: GameCardView.baseWidth * cardScale,
                      height: GameCardView.baseHeight * cardScale,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          GameCardView.baseCornerRadius * cardScale,
                        ),
                        border: Border.all(color: Colors.white10, width: 2),
                      ),
                      child: const Icon(Icons.refresh, color: Colors.white10),
                    ),
                  ),
                ),

              for (final card in gameState.playedStack)
                _buildCard(
                  card,
                  playedStackAlignment,
                  turns: 0,
                  isVisible: true,
                  cardScale: cardScale,
                ),

              for (final (playerIndex, player) in gameState.players.indexed)
                for (final (cardIndex, card) in player.hand.indexed)
                  _buildCard(
                    card,
                    _determineCardAlignment(
                      playerIndex: playerIndex,
                      handSize: player.hand.length,
                      cardIndex: cardIndex,
                    ),
                    turns: playerIndex * 0.25,
                    isVisible: true,
                    cardScale: cardScale,
                    onTap: gameState.turnPlayerIndex == playerIndex
                        ? () => onTapCard(card, playerIndex)
                        : null,
                  ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCard(
    GameCard card,
    Alignment alignment, {
    required double turns,
    required bool isVisible,
    required double cardScale,
    VoidCallback? onTap,
  }) {
    return AnimatedAlign(
      key: ValueKey<String>(card.id),
      duration: widget.animationDuration,
      curve: Curves.easeOutCubic,
      alignment: alignment,
      child: AnimatedRotation(
        duration: widget.animationDuration,
        turns: turns,
        child: GameCardView(
          card,
          scale: cardScale,
          isVisible: isVisible,
          onTap: onTap,
        ),
      ),
    );
  }
}
