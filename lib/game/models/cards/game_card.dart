import 'package:uno/game/models/cards/card_color.dart';

abstract interface class GameCard {
  String get id;

  bool canBePlayedOn(GameCard other, {CardColor? mandatoryColor});
}
