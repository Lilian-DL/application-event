import 'package:app_plan/services/auth.dart';
import 'package:flutter/material.dart';


class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _Inscription();
}

class _Inscription extends State<Inscription> {
  final AuthService auth = AuthService();
  final myControllerEmail = TextEditingController();
  final myControllerPassWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // -------------------------- Screen de l'application -----------------------
    //
    return Scaffold(
      // ------------------------ Entete de l'application -----------------------
      //
      backgroundColor: const Color.fromRGBO(36, 45, 165, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(36, 45, 165, 1),
        elevation: 0.0,
        title: const Text(
          'Bienvenue',
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.w900),
        ),
      ),

      // --------------------- Block du Login -------------------------
      //
      body: Center(
        child: Container(
            width: 300,
            height: 550,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    spreadRadius: 5,
                    blurRadius: 29,
                    offset: Offset(0, 0))
              ],
            ),
            child: Form(
              child: Column(
                children: <Widget>[
                  const Text(
                    'Inscription',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  // ---------- Le Formulaire de Connexion ----------
                  //
                  TextFormField(
                      controller: myControllerEmail,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    labelText: 'Confirmer Email',
                    border: OutlineInputBorder(),
                  )),
                  const SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                      controller: myControllerPassWord,
                      decoration: const InputDecoration(
                        labelText: 'Mot de passe',
                        border: OutlineInputBorder(),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    labelText: 'Confirmer Mot de passe',
                    border: OutlineInputBorder(),
                  )),
                  const SizedBox(
                    height: 30,
                  ),

                  // ---------- Bouton de la Connexion ----------
                  //
                  TextButton(
                    child: const Text("S'inscrire"),
                    onPressed: () {
                      auth.registerWithEmailAndPassword(
                          myControllerEmail.text, myControllerPassWord.text);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(36, 45, 165, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
