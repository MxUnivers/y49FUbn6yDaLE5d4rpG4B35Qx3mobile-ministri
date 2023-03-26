import "package:flutter/material.dart";
import 'package:torismo/style/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:card_loading/card_loading.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import '../../config/baseUrl.dart';

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}
class _VideoListPageState extends State<VideoListPage> {


  @override
  void initState() {
    super.initState();
    _getDataFromApi();
  }

  List<dynamic> _data = [];
  List<dynamic> imageList = [];

  Future<void> _getDataFromApi() async {
    final response = await http.get(Uri.parse(
        baseUrl['url'].toString()+"/api/v1/temoignages/get/all"));
    if (response.statusCode == 200 || response.statusCode == 300) {
      setState(() {
        Map<String, dynamic> _data = jsonDecode(response.body);
        print(imageList);
        imageList = _data["data"];
      });
    } else {
      print("erreur lors du chargement ..");
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

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
         SingleChildScrollView(
           child:Column(children: [
                imageList.length > 0 ?
                Container(
                  child: Column(
                    children: imageList
                        .map((data) =>   buildCardTemoignage(
                        data["title"].toString(),
                        data["description"].toString(),
                        data["coverPicture"].toString()
                    )).toList(),
                  ),
                )
                    : Container(
                  child: Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CardLoading(
                              height: 100,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              margin: EdgeInsets.only(bottom: 10),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CardLoading(
                              height: 100,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              margin: EdgeInsets.only(bottom: 10),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CardLoading(
                              height: 100,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              margin: EdgeInsets.only(bottom: 10),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CardLoading(
                              height: 100,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              margin: EdgeInsets.only(bottom: 10),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CardLoading(
                              height: 100,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              margin: EdgeInsets.only(bottom: 10),
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ])
         )
            ],
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
        Text("Tous les temoignages",
            style:GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
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


Container buildCardTemoignage(String title ,String description ,String coverPicture){
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ]
      ),
    margin: EdgeInsets.only(top: 10,bottom: 10),
    child: ListTile(
      onTap: (){
      },
      leading: Container(
        width: 100,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  coverPicture.toString(),
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(5)),
      ),
      title: Text(title.toString()),
      subtitle: Text(
        description.toString(),
        maxLines: 2,
        style: TextStyle(fontSize: 12),
      ),
      trailing: IconButton(
          style: ButtonStyle(),
          onPressed: () {},
          icon: Icon(
            Icons.group,
            color: Colors.green[700],
          )),
      isThreeLine: true,
    ),
  );
}