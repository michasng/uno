import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_command.dart';

part 'play_card_command.mapper.dart';

@immutable
@MappableClass()
class PlayCardCommand with PlayCardCommandMappable implements GameCommand {
  final int cardIndex;

  const PlayCardCommand({required this.cardIndex});
}
