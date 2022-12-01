import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memolicard_app/widgets/app.dart';
import 'package:memolicard_app/widgets/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/authentication/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State createState() {
    return LoginPageState();
  }
}
class LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getString("token") == null)
        {
          print("Pas connecté");
        }
      else {
        print("Connecté");
      }
    });
    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text("MemOlicard", style: heading1TextStyle),
                const SizedBox(height: 20),
                TextField(
                  enabled: !isLoading,
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  decoration: const InputDecoration(
                    label: Text("Nom d'utiliasateur / Email"),
                  )
                ),
                const SizedBox(height: 20),

                TextField(
                  enabled: !isLoading,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                    decoration: const InputDecoration(
                      label: Text("Mot de passe"),
                    )
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                    onPressed: () {
                      if (isLoading)
                      {
                        return;
                      }
                      setState(() {
                        isLoading = true;
                      });

                      Authenticator.check(
                        username: username,
                        password: password,
                        onSuccess: (token) async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('token', token);
                          setState(() {
                            isLoading = false;
                          });
                        },
                        onFailure: (p0) => print("Erreur !")
                      );
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(100000, 50))
                    ),

                    child: Text(!isLoading ? "Se connecter": "Connexion en cours"),
                )
              ],
            ),
          )
        )
      )
    );
  }

}