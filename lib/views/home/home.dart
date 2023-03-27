import 'dart:convert';
import 'dart:ui';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:torismo/views/home/detailvideo.dart';
import '../../config/baseUrl.dart';
import 'package:get/get.dart';
import "package:card_loading/card_loading.dart";
import "package:google_fonts/google_fonts.dart";


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _data = [];
  List<dynamic> _dataList = [];

  @override
  void initState() {
    super.initState();
    _getDataFromApi();
  }

  Future<void> _getDataFromApi() async {
    final response = await http.get(Uri.parse(
        baseUrl['url'].toString() + '/api/v1/activites/school/get/all'));
    if (response.statusCode == 200 || response.statusCode == 300) {
      setState(() {
        Map<String, dynamic> _data = jsonDecode(response.body);
        return _dataList = _data["data"];
      });
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                   _dataList.length > 0 ?
                       Container(
                          child: Column(
                            children: _dataList
                                .map((data) => buildCard(
                                    data["title"].toString(),
                                    data["description"].toString(),
                              data['coverPicture'].toString(),
                              data['video'].toString(),
                            ))
                                .toList(),
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
                                )
                              ],
                            )
                          ),
                        ),
                  Container(
                    child: SizedBox(
                      height: 25,
                    ),
                  )
                ]),

            )
        )
    );
  }
}
/*
* buildCard(
                  "titre  mon article",
                  "description l'article en question, je suis trsè "
                      "content pour vous , votre artcile est très dans "
                      "la plus part des ")
* */

Container buildCard(String title, String description, String coverPicture , String videoLink) {
  var heading = title;
  var subheading = '2 bed, 1 bath, 1300 sqft';
  var cardImage =
      NetworkImage('${coverPicture}');
  var supportingText = description;
  return Container(
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 5),
          ),
        ]
    ),
    margin: EdgeInsets.only(top: 10,bottom: 10),
    child: ListTile(

      onTap: (){
        Get.to(DetailVideoPage(title: title.toString(), description: description.toString(), videoLink: videoLink.toString()));
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
      title: Text(title.toString(), style:GoogleFonts.nunito(color:Colors.grey), maxLines: 2),
      subtitle: Text(
        description.toString(),
        maxLines: 1,
        style: GoogleFonts.nunito(color: Colors.grey[100]),
      ),
      trailing: IconButton(
          style: ButtonStyle(),
          onPressed: () {
            ()=>Get.to(DetailVideoPage(title: title.toString(), description: description.toString(), videoLink: videoLink.toString()));
          },
          icon: Icon(
            Icons.play_circle_fill,
            color: Colors.green[700],
          )),
      isThreeLine: true,
    ),
  );
}

/*
Image.network(
                coverPicture,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              )
 */