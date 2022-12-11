import 'dart:convert';

import 'package:http/http.dart' as http;

import 'cards_list.dart';

class CardsListsRepository {

  String token;

  CardsListsRepository({required this.token});

  Future<List<CardsList>?> get_all() async
  {
    Uri url = Uri.http("localhost:8000", "api/cards_lists");

    http.Response response = await http.get(url, headers: {
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<dynamic> listsData = data['hydra:member'];
      List<CardsList> lists = [];

      listsData.forEach((e) {
        CardsList cardsList = CardsList(
          name: e['name'],
          createdAt: DateTime(2020),
          updatedAt: DateTime(2020),
          id: e['id'],
        );
        lists.add(cardsList);
      });
      return lists;
    } else {
      print("Erreur");
    }


  }
}