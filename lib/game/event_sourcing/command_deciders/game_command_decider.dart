import 'package:replay/replay.dart';
import 'package:uno/game/models/game_command.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';

abstract interface class GameCommandDecider<TCommand extends GameCommand>
    implements CommandDecider<TCommand, GameEvent, GameState> {}
