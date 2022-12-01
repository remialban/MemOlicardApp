import 'package:flutter/material.dart';
import 'package:memolicard_app/widgets/variables.dart';

class Folder extends StatelessWidget
{
  const Folder({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: colorPrimary,
      ),
      child: Text("Allemand"),
    );
  }
}