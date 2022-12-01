class CardsListsRepository {

  String token;

  CardsListsRepository({required this.token});

  get_all()
  {
    Uri url = Uri.http("localhost:8000", "api/cards_lists");
  }
}