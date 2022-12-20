import 'package:memolicard_app/pages/dashboard/lists/lists.dart';
import 'package:memolicard_app/pages/dashboard/settings/settings.dart';
import 'package:memolicard_app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:memolicard_app/widgets/app.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'CartModel.dart';
import 'pages/login/login.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => CartModel(),
          child: Truc()
      )
  );
  SharedPreferences.getInstance().then((prefs) {
    if (prefs.getString("token") == null)
    {
      // runApp(const LoginPage());
      runApp(
        ChangeNotifierProvider(
          create: (context) => CartModel(),
          child: Truc()
        )
      );
    }
    else {
      runApp(const MyApp());
    }
  });

}

class Truc extends StatelessWidget {
  const Truc({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        if (cart.connected)
          {
            return MyApp();
          }
        return LoginPage();
      }
    );
  }
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});


  @override
  State createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {

  static const List<Widget> widgets = [
    ListsPage(),
    ListsPage(),
    SettingsPage(),
  ];

  int index = 0;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MemOlicard',
        theme: themeData,
        routes: {
          "/home": (context) => const ListsPage(),
          "/settings": (context) => const SettingsPage(),
        },
        home: Scaffold(
          appBar: AppBar(
            title: const Text("MemOlicard"),
          ),
          body: widgets[index],
          bottomNavigationBar: Navigation(
            callback: (value) => {
              setState(() {
                index = value;
              })}
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {

            },
          ),
        )
    );
  }
}
