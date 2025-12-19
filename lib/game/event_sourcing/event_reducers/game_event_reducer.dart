import 'package:replay/replay.dart';
import 'package:uno/game/models/game_event.dart';
import 'package:uno/game/models/state/game_state.dart';

abstract interface class GameEventReducer<TEvent extends GameEvent>
    implements EventReducer<TEvent, GameState> {}
