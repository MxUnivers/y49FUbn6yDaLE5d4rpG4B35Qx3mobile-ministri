import  "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/application_bg.jpg"),
                  fit: BoxFit.fill
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left:30,
                    width:80,
                      height:200,
                      child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(
                        "assets/images/application.jpg"
                      ))
                    ),
                  )),
                  Positioned(
                      left:30,
                      width:80,
                      height:200,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(
                                "assets/images/applicatio.jpg"
                            ))
                        ),
                      ))
                ],
              ),
            )
          ],
        )
      ),
    );
  }


}
