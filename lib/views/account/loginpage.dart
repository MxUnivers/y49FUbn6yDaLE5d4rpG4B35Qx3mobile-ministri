import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: Column(
        children: <Widget>[
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/application_bg.png"),
                  fit: BoxFit.fill),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/fete.png"))),
                    )),
                Positioned(
                    left: 140,
                    width: 80,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/conversation.png"))),
                    )),
                Positioned(
                    right: 40,
                    width: 40,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/informatif.png"))),
                    )),
                Positioned(
                    child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                            child: Text("connexion",
                                style: GoogleFonts.nunito(
                                    color: Colors.grey[900],
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold)))))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email or phone",
                              hintStyle: GoogleFonts.nunito(
                                color: Colors.grey[400],
                              )),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "mot de passe",
                              hintStyle: GoogleFonts.nunito(
                                color: Colors.grey[400],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, .6),
                      ])),
                  child: Center(
                    child: Text(
                      "Connexion",
                      style: GoogleFonts.nunito(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Text(
                  "mot de passe oublié ?",
                  style: GoogleFonts.nunito(color: Colors.grey[600]),
                ),
              ],
            ),
          )
        ],
      )),
    ));
  }
}
