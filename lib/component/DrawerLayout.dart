import 'package:flutter/material.dart';
import  "package:google_fonts/google_fonts.dart";


class MyDrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[900],
            ),
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Container(
                        height:200,width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/application_bg.jpg",
                              ),
                            fit: BoxFit.cover,

                          ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    Text(
                      "aplication", 
                      style: GoogleFonts.nunito(
                        fontSize: 22,
                      color: Colors.white
                    ),)
                  ],
                ),
              ),
            )
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('accueil'),
            onTap: () {
              Navigator.pop(context);
              // Ajouter votre logique de navigation ici
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('parametre'),
            onTap: () {
              Navigator.pop(context);
              // Ajouter votre logique de navigation ici
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('a propos de nous '),
            onTap: () {
              Navigator.pop(context);
              // Ajouter votre logique de navigation ici
            },
          ),
          ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text('Deconnexion '),
            onTap: () {
              Navigator.pop(context);
              // Ajouter votre logique de navigation ici
            },
          ),
        ],
      ),
    );
  }
}
