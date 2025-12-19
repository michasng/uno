import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_event.dart';

part 'stack_recycled_event.mapper.dart';

@immutable
@MappableClass()
class StackRecycledEvent with StackRecycledEventMappable implements GameEvent {
  const StackRecycledEvent();
}
