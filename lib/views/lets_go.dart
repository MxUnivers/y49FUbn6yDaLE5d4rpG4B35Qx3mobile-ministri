import  "package:flutter/material.dart";
import 'package:torismo/style/style.dart';
import 'package:torismo/views/navigation.dart';
import "package:get/get.dart";



class LetsGoPage extends StatefulWidget {
  const LetsGoPage({Key? key}) : super(key: key);

  @override
  State<LetsGoPage> createState() => _LetsGoPageState();
}



class _LetsGoPageState extends State<LetsGoPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(height: height),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text("Let's Travel \n The world with us" ,  style : LargeBlackTitleTextStyle()),
                ),
                const Text("Enjoy your Vacation with amazing sightseeting over the world .\n"
                    "Enjoy the best experience with us "),
                 Padding(
                    padding: EdgeInsets.only(top:50,),
                  child: SizedBox(width: 130,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20)),
                        backgroundColor: MaterialStateProperty.all(primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(containerRoundCorner)))
                      ),
                        onPressed: ()=> Get.to(NavigationPage()), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Lets Go! "),
                        Icon(Icons.arrow_forward)
                      ],
                    )),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}




class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key , required this.height}) : super(key: key);
  final  height ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height*.6,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(containerRoundCorner),
              bottomRight: Radius.circular(containerRoundCorner)
          ),
          image: DecorationImage(
              image: AssetImage("assets/letsgo.jpeg"), fit: BoxFit.cover
          )
      ),
    );
  }
}

