import 'package:uno/game/event_sourcing/event_reducers/game_event_reducer.dart';
import 'package:uno/game/models/events/color_mandated_event.dart';
import 'package:uno/game/models/state/game_state.dart';

class ColorMandatedEventReducer
    implements GameEventReducer<ColorMandatedEvent> {
  @override
  GameState reduce(ColorMandatedEvent event, GameState state) {
    return state.copyWith(mandatoryColor: event.color);
  }
}
