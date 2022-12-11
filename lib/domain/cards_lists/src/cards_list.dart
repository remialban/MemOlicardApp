/// Represent a list
class CardsList {

  int? id;

  String name;

  DateTime createdAt;
  DateTime updatedAt;
  int? boxesNumber = 1;

  CardsList({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.boxesNumber,
    this.id
  });



}