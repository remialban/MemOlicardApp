import 'package:memolicard_app/domain/api/api.dart';

import 'cards_list.dart';

class CardsListsRepository {

  Future<List<CardsList>?> getAll() async
  {
    Api api = Api(apiException: DevelopementApiException());
    var response = await api.getCollection("cards_lists");
    List listsData = response['hydra:member'];

    List<CardsList> cardsLists = [];

    for (var cardsList in listsData) {
      cardsLists.add(
        CardsList(name: cardsList["name"], createdAt: DateTime(2022), updatedAt: DateTime(2022), id: cardsList['id'])
      );
    }

    return cardsLists;
  }
}