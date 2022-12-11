import 'package:flutter/material.dart';
import 'package:memolicard_app/widgets/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/cards_lists/cards_lists.dart';
import '../../../domain/cards_lists/src/cards_lists_repository.dart';
import '../../../widgets/folders.dart';
import '../../../widgets/lists.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => ListsPageState();
}

class ListsPageState extends State<ListsPage>
{

  List<CardsList> lists = [];

  void ttt() {
  }
  @override
  Widget build(BuildContext context) {

    SharedPreferences.getInstance().then((prefs) {
      var listRepo = CardsListsRepository(token: prefs.getString("token").toString());
      listRepo.get_all().then((value) {
        print(value?.length);
        setState(() {
          lists = value!;
        });

      });
    });

    print("Longeur liste ${lists.length}");

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 9),
            child: Text("Par dossier", style: heading1TextStyle, textAlign: TextAlign.start),
          ),
          Folder(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 9),
            child: Text("Listes non classés", style: heading1TextStyle, textAlign: TextAlign.start),

          ),
          Flexible(

              child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(34, 0, 34, 90),
                  itemBuilder: (context, index) {
                    return ListCardsWidget(index: index, cardsList: lists[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 18);
                  },
                  itemCount: lists.length)
          )
        ],
      ),
    );


  }
}