import "package:flutter/material.dart";
import  "package:google_fonts/google_fonts.dart";
import "package:get/get.dart";
import 'package:torismo/views/account/loginpage.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.green,
                            Colors.indigo
                          ]
                      ),
                      image: DecorationImage(
                          image: AssetImage("assets/images/application_bg.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: <Widget>[
                        /*
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

                 */
                        Positioned(
                            child: Container(
                                margin: EdgeInsets.only(top: 50),
                                child: Center(
                                    child: Text(
                                        'créer votre compte',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunito(
                                            color: Colors.grey[100],
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
                                      hintText: "nom d'utilisateur",
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
                                      hintText: "pays",
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
                                      hintText: "téléphone",
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
                                Colors.blueGrey,
                                Colors.green,
                              ])),
                          child: Center(
                            child: Text(
                              "s'inscrire",
                              style: GoogleFonts.nunito(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 70),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "si vous avez un compte ?",
                                style: GoogleFonts.nunito(color: Colors.grey[600]),
                              ),
                              SizedBox(width: 5,),
                              ElevatedButton(
                                  onPressed: (){
                                    Get.to(LoginPage());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    foregroundColor: Colors.grey[900]
                                  ),
                                  child: Text("se connecter")
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
