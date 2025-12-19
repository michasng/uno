import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_command.dart';

part 'draw_card_command.mapper.dart';

@immutable
@MappableClass()
class DrawCardCommand with DrawCardCommandMappable implements GameCommand {
  const DrawCardCommand();
}
