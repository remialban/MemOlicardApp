class Card {
  int? id;
  String frontValue = "";
  String backValue = "";

  String side = "front";
  int currentBoxNumber = 1;

  Card(this.id, this.frontValue, this.backValue, this.side,
      this.currentBoxNumber);
}