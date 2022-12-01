import 'package:memolicard_app/widgets/variables.dart';
import 'package:flutter/material.dart';

class ListCards extends StatelessWidget
{
  int index;

  ListCards({super.key, required this.index});

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
            children: const [
              Text("Allemand",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                ),

              ),
              Text("Etudié hier",
                  style: TextStyle(
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