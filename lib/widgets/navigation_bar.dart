import 'package:flutter/material.dart';

class Navigation extends StatefulWidget
{
  void Function(int) callback;
  Navigation({super.key, required this.callback});


  @override
  State createState() {
    return NavigationBarState(this.callback);
  }
}

class NavigationBarState extends State<Navigation>
{
  void Function(int) callback;

  NavigationBarState(this.callback);

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Listes"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Paramètres"),
      ],
      onTap: (value) {
        setState(() {
          index = value;
        });
        this.callback(value);
      },
      currentIndex: index,

    );
  }

}