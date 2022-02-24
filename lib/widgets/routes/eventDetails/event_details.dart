import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.2,
                0.6,
                0.8,
              ],
              colors: <Color>[
                Color.fromRGBO(36, 45, 165, 1.0),
                Color.fromRGBO(39, 50, 185, 1.0),
                Color.fromRGBO(13, 19, 132, 1.0)
              ]),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            // ---------- AppBar et titre de la page ---------- //
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBar(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back, size: 36),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: true,
                      title: Row(
                        children: const <Widget>[
                          SizedBox(
                            height: 60,
                            width: 60,
                          ),
                          Text(
                            'Détails',
                            style: TextStyle(
                                fontSize: 42,
                                fontFamily: 'Quigleyw',
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            // ---------- Carte de l'événement -> Taille/couleurs/ombre ---------- //
            body: Center(
                child: Container(
              alignment: Alignment.center,
              height: 800,
              width: 420,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 48, 48, 48).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              // ---------- Carte de l'événement -> Bordures/Bannière ---------- //
              child: Column(children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 49, 49, 49),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  // ---------- Titre de l'événement' ---------- //
                  child: const Text(
                    'Brocante d\'instruments',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                // ---------- Image de l'événement ---------- //
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    'https://media.discordapp.net/attachments/902535167850197022/935814927443165254/unknown.png',
                    fit: BoxFit.fill,
                    width: 250,
                    height: 150,
                  ),
                ),
                Container(
                  height: 32,
                  width: 232,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color.fromARGB(255, 235, 235, 235),
                      width: 4,
                    ),
                  ),
                  // ---------- Lieu de l'événement ---------- //
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.location_on),
                      Text(
                        " 7 rue du bois à Montpellier",
                      ),
                    ],
                  ),
                ),
                // ---------- Date de l'événement ---------- //
                Container(
                  height: 32,
                  width: 232,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color.fromARGB(255, 235, 235, 235),
                      width: 4,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.calendar_today),
                      Text(' Du ' '05/03/2022' ' au ' '05/03/2022'),
                    ],
                  ),
                ),
                // ---------- Description de l'événement ---------- //
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 235, 235),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color.fromARGB(255, 235, 235, 235),
                          width: 4,
                        ),
                      ),
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: const Text(
                        'Vous possèdez des instruments que vous n\'utilisez plus ? Alors vous êtes au bon endroit, venez vendre vos instruments à la brocante organisée par l\'association, vous vous débarassez et vous faites plaisir à quelqu\'un !',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                // ---------- Alerte personnalisable ---------- //
                Container(
                  height: 32,
                  width: 210,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 53, 53),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color.fromARGB(255, 223, 53, 53),
                      width: 4,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.bug_report),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Pass sanitaire obligatoire !',
                        ),
                      )
                    ],
                  ),
                ),
                // ---------- Bouton s'inscire ou se désinscrire en fonction du cas ---------- //
                ElevatedButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: const Text('Désinscription'),
                      content: const Text('Quitter cet événement ?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Oui...'),
                          child: const Text('Oui...'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Non !'),
                          child: const Text('Non !'),
                        ),
                      ],
                    ),
                  ),
                  child: const Text("Se désinscrire"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 245, 23, 23))),
                )
              ]),
            ))));
  }
}
