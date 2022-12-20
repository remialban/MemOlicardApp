import 'card.dart';

/// Represent a list
class CardsList {

  int? id;

  String name;

  DateTime createdAt;
  DateTime updatedAt;
  int? boxesNumber = 1;

  List<Card> cards;

  CardsList({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.cards,
    this.boxesNumber,
    this.id
  });

  int numberOfCards() {
    return cards.length;
  }

}