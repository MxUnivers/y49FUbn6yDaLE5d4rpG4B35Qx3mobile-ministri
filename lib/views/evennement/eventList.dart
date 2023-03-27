import "package:flutter/material.dart";
import 'package:torismo/style/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:card_loading/card_loading.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:torismo/views/home/detailvideo.dart';
import '../../config/baseUrl.dart';
import "package:carousel_slider/carousel_slider.dart";

List<dynamic> _eventList = [];

class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  @override
  void initState() {
    super.initState();
    _getDataFromApi();
  }

  List<dynamic> _data = [];

  Future<void> _getDataFromApi() async {
    final response = await http.get(Uri.parse(
        baseUrl['url'].toString() + "/api/v1/activites/event/get/all"));
    if (response.statusCode == 200 || response.statusCode == 300) {
      setState(() {
        Map<String, dynamic> _data = jsonDecode(response.body);
        print(_eventList);
        _eventList = _data["data"];
      });
    } else {
      print("erreur lors du chargement ..");
      throw Exception('Failed to load data from API');
    }
  }

  int _current = 0;
  dynamic _selectedEvent = {};
  @override
  Widget build(BuildContext context) {
    String image = "vue_degagé_montage";
    // appele des apis

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: _selectedEvent.length > 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.arrow_forward_ios,
                size: 100,
              ),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    height: 500,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.70,
                    enlargeCenterPage: true),
                items: _eventList.map((data) {
                  return Builder(builder: (context) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_selectedEvent == data) {
                              _selectedEvent = {};
                            } else {
                              _selectedEvent = data;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          width: double.infinity,
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: _selectedEvent == data
                                  ? Border.all(
                                      color: Colors.green.shade500, width: 3)
                                  : null,
                              boxShadow: _selectedEvent == data
                                  ? [
                                      BoxShadow(
                                          color: Colors.green.shade100,
                                          blurRadius: 30,
                                          offset: Offset(0, 10))
                                    ]
                                  : [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          offset: Offset(0, 5))
                                    ]),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                    height: 350,
                                    clipBehavior: Clip.hardEdge,
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network(
                                        data["coverPicture"].toString(),
                                        fit: BoxFit.cover)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(data["title"].toString(),
                                    style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(data["description"].toString() + "...",
                                    maxLines: 3,
                                    style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        color: Colors.grey.shade600)),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child:
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: 20)),
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      containerRoundCorner)))),
                                      onPressed: () {
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children:  [
                                          Text("aller vers ",
                                            style:GoogleFonts.nunito(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                            )
                                          ),
                                          Icon(Icons.arrow_forward)
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                        ));
                  });
                }).toList()),
          ],
        )),
      ),
    );
  }
}
