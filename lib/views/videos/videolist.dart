import "package:flutter/material.dart";
import 'package:torismo/style/style.dart';
import 'package:torismo/views/videos/detailvideo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../detail.dart';


class VideoListPage extends StatelessWidget {
  const VideoListPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "letsgo",
      "chicago",
      "maison",
      "parc",
      "tobogan",
      "letsgo",
      "chicago",
      "maison",
      "parc",
      "tobogan",
      "vue_degagé_montage"
    ];
    String image = "vue_degagé_montage";

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [

              SerchVideoWidget(),
              const SizedBox(
                height: 25,
              ),
              TextWidget(),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (imageList.length == 0) {
                    Center(
                      child: Text("Aucn element trouvés"),
                    );
                    /*
                    if(imageList.length == 0){
                    Container(
                      child: Text("Aucn element trouvés" , style: GoogleFonts.poppins(
                        fontSize: 20
                      ),
                     ),
                     );
                     }
                     */
                  }
                  return Card(

                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child: ListTile(
                      onTap: ()=>Get.to(DetailVideoPage()),
                      leading: Container(
                        width: 100,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/${imageList[index]}.jpeg",
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      title: Text(imageList[index]),
                      subtitle: Text(
                        'A sufficiently long subtitle warrants three lines.',
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: IconButton(
                          style: ButtonStyle(),
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_circle_fill,
                            color: Colors.green[700],
                          )),
                      isThreeLine: true,
                    ),
                  );
                },
                itemCount: imageList.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Toutes les vidéos",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}

class SerchVideoWidget extends StatelessWidget {
  const SerchVideoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),

            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 1, offset: Offset(0, 3))
            ]),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_outlined,
              color: blackColor,
              size: 20,
            ),
              hintText: "Rechercher ...",
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none
          ),
        ));
  }
}
