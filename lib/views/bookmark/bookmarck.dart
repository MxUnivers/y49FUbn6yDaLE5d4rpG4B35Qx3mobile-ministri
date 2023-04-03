import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:torismo/views/bookmark/programbookmarklist.dart';
import 'package:torismo/views/bookmark/temoignagebookmarklist.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:torismo/views/bookmark/videobookmarklist.dart';
import 'package:torismo/views/bookmark/eventbookmarklist.dart';

var videosItems = {
  'Vidéos',
  '\30',
  'assets/icons/bookmarks/video.png',
}.toList();
var temoignagesItems ={
  'Témoignages',
  '\10',
  'assets/icons/bookmarks/examen.png'
}.toList();
var eventItems = {
  'Evenements',
  '\10',
  'assets/icons/bookmarks/un-evenement.png'
}.toList();
var programmeItems = {
  'Programmes',
  '\10',
  'assets/icons/bookmarks/calendrier.png'
}.toList();

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;




    return Scaffold(
        backgroundColor: Color(0xFFFCFAF8),
        body: ListView(children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    // Videos
                    _buildCard(videosItems[0].toString(),videosItems[1].toString(), videosItems[2].toString(), false, false, context),
                    _buildCard(temoignagesItems[0].toString(),temoignagesItems[1].toString(), temoignagesItems[2].toString(), false, false, context),
                    _buildCard(eventItems[0].toString(),eventItems[1].toString(), eventItems[2].toString(), false, false, context),
                    _buildCard(programmeItems[0].toString(),programmeItems[1].toString(), programmeItems[2].toString(), false, false, context)
                  ])),
          SizedBox(height: 15.0)
        ]));
  }
}

Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {
  return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
          onTap: () {
            if (name == videosItems[0]){
              Get.to(VideoBookmarkPage());
            }
            if (name == temoignagesItems[0]){
              Get.to(TemoignageBookmarkPage());
            }
            if (name == eventItems[0]){
              Get.to(EventBookmarkPage());
            }
            if (name == programmeItems[0]){
              Get.to( ProgramBookmarkPage());
            }
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isFavorite
                              ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                              : Icon(Icons.favorite_border,
                                  color: Color(0xFFEF7532))
                        ])),
                Hero(
                    tag: imgPath,
                    child: Image.asset(
                      imgPath,
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 7.0),
                Text(price,
                    style: TextStyle(
                        color: Color(0xFFCC8053),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (!added) ...[
                            Icon(Icons.shopping_basket,
                                color: Color(0xFFD17E50), size: 12.0),
                            Text('Voire',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontSize: 12.0))
                          ],
                          if (added) ...[
                            Icon(Icons.remove_circle_outline,
                                color: Color(0xFFD17E50), size: 12.0),
                            Text('3',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0)),
                            Icon(Icons.add_circle_outline,
                                color: Color(0xFFD17E50), size: 12.0),
                          ]
                        ]))
              ]))));
}
