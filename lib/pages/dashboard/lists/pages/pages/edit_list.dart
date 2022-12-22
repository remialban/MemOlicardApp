import 'package:flutter/material.dart';
import 'package:memolicard_app/domain/cards_lists/cards_lists.dart';

class EditListPage extends StatefulWidget {
  CardsList cardsList;

  EditListPage({super.key, required this.cardsList});

  @override
  State<StatefulWidget> createState() => EditListPageState();
}

class EditListPageState extends State<EditListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier la liste"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Salut", textAlign: TextAlign.left),
            Text("Comment ca va ?"),
          ],
        ),
      ),
    );
  }
}