import 'package:flutter/material.dart';
import 'package:memolicard_app/widgets/variables.dart';

import '../../../widgets/folders.dart';
import '../../../widgets/lists.dart';

class ListsPage extends StatelessWidget
{
  const ListsPage({super.key});


  @override
  Widget build(BuildContext context) {
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
                    return ListCards(index: index);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 18);
                  },
                  itemCount: 20)
          )
        ],
      ),
    );

  }
}