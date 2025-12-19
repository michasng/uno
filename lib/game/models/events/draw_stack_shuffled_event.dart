import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_event.dart';

part 'draw_stack_shuffled_event.mapper.dart';

@immutable
@MappableClass()
class DrawStackShuffledEvent
    with DrawStackShuffledEventMappable
    implements GameEvent {
  const DrawStackShuffledEvent();
}
