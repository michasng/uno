import 'package:flutter/material.dart';
import 'package:uno/pages/play/widgets/game_view.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: GameView(),
      ),
    );
  }
}
