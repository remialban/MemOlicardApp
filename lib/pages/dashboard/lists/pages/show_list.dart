import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/cards_lists/src/cards_list.dart';

class ShowListPage extends StatefulWidget {
  CardsList cardsList;

  ShowListPage({super.key, required this.cardsList});

  @override
  State<StatefulWidget> createState() => ShowListPageState();
}

class ShowListPageState extends State<ShowListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Text(widget.cardsList.name),
         ),
        body: const Text("Salut tout le monde!"),
    );
  }
}