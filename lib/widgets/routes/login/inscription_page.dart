import 'package:app_plan/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../eventList/event_list.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _Inscription();
}

class _Inscription extends State<Inscription> {
  final AuthService auth = AuthService();
  final myControllerEmail = TextEditingController();
  final myControllerNom = TextEditingController();
  final myControllerPassWord = TextEditingController();
  final myControllerPrenom = TextEditingController();
  String messageError = "";
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
                      controller: myControllerNom,
                      decoration: const InputDecoration(
                        labelText: 'Nom',
                        border: OutlineInputBorder(),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: myControllerPrenom,
                      decoration: const InputDecoration(
                        labelText: 'Prénom',
                        border: OutlineInputBorder(),
                      )),
                  const SizedBox(
                    height: 30,
                  ),

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
                      controller: myControllerPassWord,
                      decoration: const InputDecoration(
                        labelText: 'Mot de passe',
                        border: OutlineInputBorder(),
                      )),
                  const SizedBox(
                    height: 18,
                  ),

                  Text(
                    messageError,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.red,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  // ---------- Bouton de la Connexion ----------
                  //
                  TextButton(
                    child: const Text("S'inscrire"),
                    onPressed: () async {
                      if (myControllerEmail.text.isNotEmpty &&
                          myControllerPassWord.text.isNotEmpty &&
                          myControllerNom.text.isNotEmpty &&
                          myControllerPrenom.text.isNotEmpty) {
                        final user = await auth.registerWithEmailAndPassword(
                            myControllerEmail.text, myControllerPassWord.text);
                        await Future.delayed(new Duration(milliseconds: 500),
                            () {
                          if (user == null) {
                            setState(() {
                              messageError = "Une erreur est survenu !";
                            });
                          } else {
                            addUser(myControllerEmail.text,
                                myControllerNom.text, myControllerPrenom.text);
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const EventList(),
                                transitionDuration: const Duration(seconds: 0),
                              ),
                            );
                          }
                        });
                        /*showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                const Inscription(),
                                            transitionDuration:
                                                const Duration(seconds: 0),
                                          ),
                                        );
                                      },
                                      child: const Text("Inscription"),
                                    ),
                                  ],
                                );
                              });*/
                      } else {
                        print(
                            "Une erreur s'est produite lors de la saisie des informations!");
                      }
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

Future<void> addUser(email, nom, prenom) {
  CollectionReference users = FirebaseFirestore.instance.collection('User');
  User? result = FirebaseAuth.instance.currentUser;
  return users
      .doc(result!.uid)
      .set({
        'Email': email,
        'FirstName': prenom,
        'LastName': nom,
        'Picture':
            "https://media.discordapp.net/attachments/902535167850197022/935551661001302026/Clem.jpg?width=661&height=663",
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
