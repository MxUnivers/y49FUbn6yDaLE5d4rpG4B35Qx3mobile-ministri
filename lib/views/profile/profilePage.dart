import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var tProfileImage =  "assets/icons/profile/utilisateur.png";
  var nameProfile =  "Nom d'ultisateur";
  var emailProfile =  "email@gmail.com";
  var TextEddit =  "Modifier";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height:120,
                child: ClipRect(
                    child: Image(image:AssetImage(tProfileImage.toString()))
                ),
              ),
              const  SizedBox(height:10),
              Text(nameProfile.toString(),style:GoogleFonts.nunito(
                  fontSize: 25, fontWeight: FontWeight.bold
              )),
              Text(emailProfile.toString(),style:GoogleFonts.nunito(
                  fontSize: 15, fontWeight: FontWeight.w500
              )),
              const  SizedBox(height:20),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: (){}
                    , child: Text(TextEddit.toString(), style: GoogleFonts.nunito(fontSize: 20,fontWeight: FontWeight.w700),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    padding: EdgeInsets.all(5),
                    side: BorderSide.none,
                    shape: const StadiumBorder()
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const Divider(),
              const SizedBox(height: 10,),
              ListTile(
                leading: Container(
                  width: 30,height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:Colors.white70.withOpacity(0.1)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}