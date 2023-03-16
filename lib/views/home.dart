import "package:flutter/material.dart";
import 'package:torismo/style/style.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:get/get.dart";
import  'detail.dart';
import  "../config/dataApi.dart";




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
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
      backgroundColor: Colors.white70,
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * .35,
              child: ListView.builder(
                  scrollDirection:Axis.horizontal ,
                  shrinkWrap: true,
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: ()=>Get.to(DetailPage(title: imageList[index])),
                        child: ImageWidget(
                            height: height,
                            width: width,
                            image: imageList[index]));
                  }),
            ),
            TextWidget(title:"Vidéos Recent",),
            const SizedBox(
              height: 5,
            ),
            VideosWidget(),
            SizedBox(height: 20,),
            TextWidget(title:"Programmes de la semaines",),
            const SizedBox(
              height: 5,
            ),
            VideosWidget(),
            SizedBox(height: 20,),
            TextWidget(title:"Videos de listes",),
            const SizedBox(
              height: 5,
            ),
            VideosWidget(),
            SizedBox(child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 2,
              color: Colors.grey[200],
            ),),
            SizedBox(
              height: 20,
            ),
            SocialMediaWidget(),
            SizedBox(
              height: 100,
            ),


          ],
        ),
      ),
    ),

    );
  }
}






class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.title
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 10 ,  vertical: 10),
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title.toString(),
              style:
              GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
          Text("View All", style: subTitleTextStyle()),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget(
      {Key? key,
      required this.height,
      //required this.imageList,
      required this.width,
      required this.image}
      )
      : super(key: key);

  final double height;
  // final List<String> imageList;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Container(
        height: height*.1,
        width: width *.9,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/${image}.jpeg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                image,
                style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.star, color: amberColor, size: 15),
                  Icon(Icons.star, color: amberColor, size: 15),
                  Icon(Icons.star, color: amberColor, size: 15),
                  Icon(Icons.star, color: amberColor, size: 15),
                  Icon(Icons.star, color: amberColor, size: 15),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "4.5",
                    style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              trailing: CircleAvatar(
                radius: 15,
                backgroundColor: whiteColor,
                child: const Icon(
                    Icons.favorite,
                    color: Colors.red, size: 25
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



List category = [
  {
    "icon": "assets/chicago.jpeg",
    "name": "titre de la vidéo 1",
    "color": Colors.teal[200]
  },

  {
    "icon": "assets/lac.jpeg",
    "name": "titre de la vidéo 2",
    "color": Colors.teal[200]
  },
  {
    "icon": "assets/letsgo.jpeg",
    "name": "titre de la vidéo 3",
    "color": Colors.teal[200]
  },
  {
    "icon": "assets/maison.jpeg",
    "name": "titre de la vidéo 3",
    "color": Colors.teal[200]
  },
  {
    "icon": "assets/tobogan.jpeg",
    "name": "titre de la vidéo 5",
    "color": Colors.teal[200]
  },
];
Widget VideosWidget() {
  return Container(
    height: 120,
    margin: EdgeInsets.only(top: 8),
    padding: EdgeInsets.only(top: 8),
    child: ListView.builder(

      scrollDirection: Axis.horizontal,
      itemCount: category.length,
      itemBuilder: (context, i) {
        var item = category.elementAt(i);
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: (){
              print("");
            } ,
            child: Column(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(item['icon'].toString()),
                          fit: BoxFit.cover
                      )
                  ),

                ),
                Text(item['name'].toString(),maxLines: 2,textAlign:TextAlign.start,)
              ],
            ),
          )
        );
      },
    ),
  );
}




class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text("Reseaux scociaux" ,style: GoogleFonts.nunito(fontSize: 20),),
          ),
          SizedBox(height: 20,),
          Container(
              margin: EdgeInsets.only(top: 20 , bottom: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child:
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                shrinkWrap: true,
                children: List.generate(socialNetworkList.length, (index) {
                  return GestureDetector(
                    onTap: (){},
                    child:
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                              AssetImage(socialNetworkList[index]["coverPicture"].toString()),
                              fit: BoxFit.cover),
                          borderRadius:
                          BorderRadius.circular(containerRoundCorner)),

                    ),
                  );
                }),
              )


          )
        ],
      ),
    );
  }
}
