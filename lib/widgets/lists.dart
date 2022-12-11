import 'package:memolicard_app/widgets/variables.dart';
import 'package:flutter/material.dart';

import '../domain/cards_lists/cards_lists.dart';

class ListCardsWidget extends StatelessWidget
{
  int index;
  CardsList cardsList;

  ListCardsWidget({super.key, required this.index, required this.cardsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(color: materialColor.shade200),
        color: Colors.white,
      ),
      height: 77,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        verticalDirection: VerticalDirection.down,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(cardsList.name,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black
                ),

              ),
              Text("Etudié hier",
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black
                )
              ),
            ],
          ),

          Text("$index\ncartes",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black
            ),
            textAlign: TextAlign.center
          )

        ],
      ),
    );
  }
}