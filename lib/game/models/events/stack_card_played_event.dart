import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/game_event.dart';

part 'stack_card_played_event.mapper.dart';

@immutable
@MappableClass()
class StackCardPlayedEvent
    with StackCardPlayedEventMappable
    implements GameEvent {
  const StackCardPlayedEvent();
}
