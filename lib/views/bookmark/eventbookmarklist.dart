import 'dart:convert';
import 'dart:ui';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:torismo/views/home/detailvideo.dart';
import '../../config/baseUrl.dart';
import 'package:get/get.dart';
import "package:card_loading/card_loading.dart";
import "package:google_fonts/google_fonts.dart";

class EventBookmarkPage extends StatefulWidget {
  @override
  _EventBookmarkPageState createState() => _EventBookmarkPageState();
}

class _EventBookmarkPageState extends State<EventBookmarkPage> {
  List<dynamic> _data = [];
  List<dynamic> _dataList = [];

  @override
  void initState() {
    super.initState();
    _getDataFromApi();
  }

  Future<void> _getDataFromApi() async {
    final response = await http.get(Uri.parse(
        baseUrl['url'].toString() + "/api/v1/activites/event/get/all"));
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "évenements enregistrès",
            style: GoogleFonts.nunito(
                color: Colors.grey[700], fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.grey[200],
                  child: IconButton(
                    icon: Icon(
                      Icons.event,
                      size: 20,
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    children: [
                      // Background Bookmrk video
                      BackgroundBookmarkVideo(
                          "assets/images/evenements/evenements.jpg"),
                      // Listes des vidéos reagarder
                      Column(children: [
                        _dataList.length > 0
                            ? Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: _dataList
                                      .map((data) => buildCard(
                                            data["title"].toString(),
                                            data['coverPicture'].toString(),
                                          ))
                                      .toList(),
                                ),
                              )
                            : LoaderVideoBookmark(),
                        Container(
                          child: SizedBox(
                            height: 25,
                          ),
                        )
                      ]),
                    ],
                  ),
                ))));
  }
}
/*
* buildCard(
                  "titre  mon article",
                  "description l'article en question, je suis trsè "
                      "content pour vous , votre artcile est très dans "
                      "la plus part des ")
* */

Container buildCard(String title, String coverPicture) {
  return Container(

    decoration: BoxDecoration(
        color: Colors.grey[500],
        boxShadow: [
      BoxShadow(
        blurRadius: 0.5,
        offset: Offset(0, 2),
      ),
    ], borderRadius: BorderRadius.circular(30)),
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: ListTile(
      onTap: () {},
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
      title: Text(title.toString(),
          style: GoogleFonts.nunito(color: Colors.grey[100], fontSize: 20),
          maxLines: 3),
      subtitle: Text(
        "",
        maxLines: 2,
        style: GoogleFonts.nunito(color: Colors.grey),
      ),
      trailing: IconButton(
          style: ButtonStyle(),
          onPressed: () {},
          icon:
              Icon(Icons.event, color: Colors.green[700], size: 40)),
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

Container BackgroundBookmarkVideo(String assetImage) {
  return Container(
    height: 250,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(assetImage.toString()),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
        Colors.black.withOpacity(.6),
        Colors.black.withOpacity(.1)
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "Listes des evenements",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            padding: EdgeInsets.symmetric(vertical: 3),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search vidéos",
                  hintStyle: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontSize: 13,
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    ),
  );
}

Container LoaderVideoBookmark() {
  return Container(
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
    )),
  );
}
