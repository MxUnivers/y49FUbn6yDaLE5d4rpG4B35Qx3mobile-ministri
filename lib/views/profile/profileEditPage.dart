import  "package:flutter/material.dart";
import  "package:google_fonts/google_fonts.dart";

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String _name = "Nom d'utlisateur";
  String _email = "johndoe@example.com";
  String _phone = "555-555-5555";
  String _birthdate = "01/01/1990";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text("Profil" , style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color:Colors.grey[900]
        ),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.green[800],
              child: const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "nom d'utlisateur",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Adresse e-mail",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Numéro de téléphone",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _phone = value;
                  });
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Date de naissance",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _birthdate = value;
                  });
                },
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.done,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){}
              , child: Text("enregistrer le modfications", style: GoogleFonts.nunito(fontSize: 25,fontWeight: FontWeight.w700),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                  padding: EdgeInsets.all(5),
                  side: BorderSide.none,
                  shape: const StadiumBorder()
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
