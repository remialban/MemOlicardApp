class Card {
  int? id;
  String frontValue = "";
  String backValue = "";

  String side = "front";
  int currentBoxNumber = 1;

  Card({
    this.id,
    required this.frontValue,
    required this.backValue,
    required this.side,
    required this.currentBoxNumber
  });
}