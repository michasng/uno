import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_command.dart';

part 'pass_turn_command.mapper.dart';

@immutable
@MappableClass()
class PassTurnCommand with PassTurnCommandMappable implements GameCommand {
  const PassTurnCommand();
}
