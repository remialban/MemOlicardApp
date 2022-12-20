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

  Future<void> updateLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var listRepo = CardsListsRepository();
    var value = await listRepo.getAll();

    setState(() {
      lists = value!;
    });
  }

  @override
  void initState() {
    super.initState();
    updateLists();
  }
  @override
  Widget build(BuildContext context) {




    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 9),
            child: const Text("Listes non classés", style: heading1TextStyle, textAlign: TextAlign.start),

          ),
          Flexible(

              child: RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                onRefresh: () {          return updateLists();
                },
                child:


              ListView.separated(
                  padding: const EdgeInsets.fromLTRB(34, 0, 34, 90),
                  itemBuilder: (context, index) {
                    return ListCardsWidget(index: index, cardsList: lists[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 18);
                  },
                  itemCount: lists.length)
          ))
        ],
      ),
    );


  }
}