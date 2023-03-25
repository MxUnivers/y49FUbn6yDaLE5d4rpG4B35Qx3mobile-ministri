import 'dart:convert';
import 'dart:ui';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import "package:google_fonts/google_fonts.dart";
import 'package:torismo/views/videos/detailvideo.dart';
import '../config/baseUrl.dart';
import 'package:get/get.dart';
import "package:card_loading/card_loading.dart";


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
        baseUrl['url'].toString() + '/api/v1/temoignages/get/all'));
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

Card buildCard(String title, String description, String coverPicture , String videoLink) {
  var heading = title;
  var subheading = '2 bed, 1 bath, 1300 sqft';
  var cardImage =
      NetworkImage('${coverPicture}');
  var supportingText = description;
  return Card(
      color: Colors.white,
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(heading,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w900,
                )),
            subtitle: Text(subheading),
            trailing: IconButton(
              icon: Icon(Icons.favorite_outline),
              onPressed: () {},
            ),
          ),
          Container(
            height: 200.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
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
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText),
          ),
          ButtonBar(
            children: [
              TextButton(
                  child: Text('voire',
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  onPressed: () {
                     Get.to(
                        DetailVideoPage(title: title.toString(), description: description.toString(), videoLink: videoLink.toString())
                    );
                  }
                  ),
              ElevatedButton(
                child: Text('reqarder plus tard',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700, fontSize: 15)),
                onPressed: () {/* ... */},
              )
            ],
          )
        ],
      ));
}
