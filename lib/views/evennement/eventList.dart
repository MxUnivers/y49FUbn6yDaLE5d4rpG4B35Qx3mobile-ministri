import "package:flutter/material.dart";
import 'package:torismo/style/style.dart';
import 'package:google_fonts/google_fonts.dart';



class EventListPage extends StatelessWidget {
  const EventListPage({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextWidget(),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: height * .35,
                child: GestureDetector(
                          onTap: (){},
                          child: EventListFirtWidget(
                              height: height,
                              width: width,
                              image: imageList[0]))
              ),
              BeginEventWidget(imageList:imageList,)
              //


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
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Text("Evenement dela liste",
                 style:
                 GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20)
             ),
             SizedBox(height: 10,),
             Text("Suivez les venement du jour",
                 style:
                 GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12)
             ),
           ],
          ),
        ),
        Spacer(),
        Container(
          child: Text("View All", style: subTitleTextStyle()),
        )

      ],
    );
  }
}



class EventListFirtWidget extends StatelessWidget {
  const EventListFirtWidget(
      {Key? key,
        required this.height,
        //required this.imageList,
        required this.width,
        required this.image})
      : super(key: key);

  final double height;
  // final List<String> imageList;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Container(
        height: height * .3,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/${image}.jpeg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(containerRoundCorner)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              onTap: (){},
              title: Text(
                image,
                style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 25,
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
              
              trailing: Container(
                width: 90,
                child: MaterialButton(
                  color: Colors.white,
                  elevation: 1,
                  onPressed: (){},
                  child: Container(
                    width: 100,
                    child: Row(
                      children: [
                        Text("Voire"),
                        SizedBox(width: 5,),
                        Icon(
                            Icons.remove_red_eye_sharp,
                            color: Colors.red, size: 20
                        ),
                      ],
                    ),
                  ),
                ),
              )
              ),

          ],
        ),
      ),
    );
  }
}



class BeginEventWidget extends StatelessWidget {
  const BeginEventWidget({
    Key? key,
    required this.imageList
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {

        return  ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return  Container(

              child: ListTile(
                onTap:(){
                  print(imageList[index].toString());
                } ,
                leading: Container(
                  width: 100,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/${imageList[index]}.jpeg",
                          ),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
                title: Text(imageList[index]),
                subtitle:
                Text('A sufficiently long subtitle warrants three lines.' , maxLines: 2 , style: TextStyle(fontSize: 12),),
                trailing: IconButton(
                    style: ButtonStyle(),
                    onPressed: (){}, icon:
                Icon(Icons.calendar_month_outlined ,  size: 25, color: Colors.deepPurple,)
                ),
                isThreeLine: true,
              ),
            );
          },
          itemCount: imageList.length,
        );
  }
}





