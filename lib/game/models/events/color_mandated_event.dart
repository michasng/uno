import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:uno/game/models/cards/card_color.dart';
import 'package:uno/game/models/game_event.dart';

part 'color_mandated_event.mapper.dart';

@immutable
@MappableClass()
class ColorMandatedEvent with ColorMandatedEventMappable implements GameEvent {
  final CardColor? color;

  const ColorMandatedEvent({required this.color});
}
