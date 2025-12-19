import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_command.dart';

part 'start_game_command.mapper.dart';

@immutable
@MappableClass()
class StartGameCommand with StartGameCommandMappable implements GameCommand {
  final int? rngSeed;
  final int playerCount;
  final int handSize;

  const StartGameCommand({
    this.rngSeed,
    required this.playerCount,
    required this.handSize,
  });
}
