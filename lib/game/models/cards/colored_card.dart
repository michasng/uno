import 'package:uno/game/models/cards/card_color.dart';
import 'package:uno/game/models/cards/game_card.dart';

abstract interface class ColoredCard implements GameCard {
  CardColor get color;
}
