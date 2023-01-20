import  "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:torismo/style/style.dart';


class DetailPage extends StatelessWidget {
  String title ;
  DetailPage({Key? key , required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double  height  =  MediaQuery.of(context).size.height ;
    return Stack(
      children: [
        BackImageWidget(height: height, title: title),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height*.5,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(containerRoundCorner),
                topRight: Radius.circular(containerRoundCorner)
              ),
              color: whiteColor
            ),
            child: Padding(
              padding: const  EdgeInsets.symmetric(horizontal: 30  , vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(title ,  style: LargeBlackTitleTextStyle()),
                  Row(
                    children: [
                      Icon(Icons.star ,  size: 20 ,color: amberColor,),
                      Text("5 (100+)" ,  style: subTitleTextStyle(),),
                      Spacer(),
                      Text("See All Reviews",style : subTitlePrimaryTextStyle())
                    ],
                  ),
                  const  SizedBox(height: 20,),
                  Text("Description",  style: titleTextStyle() ),
                  Text(
                      "salut tout le onde je suis très content de vous revoir dans cas de figure je suis super heureux de vous revoire "
                          "salut tout le onde je suis très content de vous revoir dans cas de figure je suis super heureux de vous revoire "
                          ,
                    style: subTitleTextStyle(),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$800/day" ,  style: titlePrimaryTextStyle()
                      ),
                      const Spacer(),
                      Container(
                        height: containerRoundCorner -5 ,
                        width: containerRoundCorner - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: blackLightColor)
                        ),
                        child: Center(
                          child: Text("-" ,style: subTitleTextStyle() , ),
                        ),
                      ) ,
                      SizedBox(
                        height: containerRoundCorner-5,
                        width: containerRoundCorner-5,
                        child: Text(
                          "5",style: subTitleTextStyle(),
                        ),
                      ),
                      Container(
                        height: containerRoundCorner -5 ,
                        width: containerRoundCorner - 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: blackLightColor)
                        ),
                        child: Center(
                          child: Text("+" ,style: subTitleTextStyle() , ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                      onPressed: (){},
                      child: const  Text("Discover")
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


class BackImageWidget extends StatelessWidget {
  const BackImageWidget({
    Key? key ,
    required this.height,
    required this.title
  }) : super(key: key);

  final  height ;
  final title ;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: height*.5,
        width: double.infinity,
        child: Image(image:AssetImage("assets/${title}.jpeg") ,  fit: BoxFit.cover),
      ),
    );
  }
}
