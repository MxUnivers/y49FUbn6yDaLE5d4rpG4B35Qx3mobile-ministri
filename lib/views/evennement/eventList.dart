import "package:flutter/material.dart";
import 'package:torismo/style/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:card_loading/card_loading.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import '../../config/baseUrl.dart';

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
  List<dynamic> eventList = [];

  Future<void> _getDataFromApi() async {
    final response = await http.get(Uri.parse(
        baseUrl['url'].toString() + "/api/v1/activites/events/get/all"));
    if (response.statusCode == 200 || response.statusCode == 300) {
      setState(() {
        Map<String, dynamic> _data = jsonDecode(response.body);
        print(eventList);
        eventList = _data["data"];
      });
    } else {
      print("erreur lors du chargement ..");
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    String image = "vue_degagé_montage";
    // appele des apis

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
                      onTap: () {},
                      child: EventListFirtWidget(
                          height: height, width: width, image: eventList))),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return cardEvent("", "", "");
                  })
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
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Text("Suivez les venement du jour",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ),
        Spacer(),

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
  final List<dynamic> image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Container(
        height: height * .3,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image[0]["coverPicture"].toString()), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(containerRoundCorner)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
                onTap: () {},
                title: Text(
                  image[0]["title"].toString(),
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
                    onPressed: () {},
                    child: Container(
                      width: 100,
                      child: Row(
                        children: [
                          Text("Voire"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.remove_red_eye_sharp,
                              color: Colors.red, size: 20),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

Container cardEvent(String title, String description, String coverPicture) {
  return Container(
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
            Icons.calendar_month_outlined,
            size: 25,
            color: Colors.deepPurple,
          )),
      isThreeLine: true,
    ),
  );
}
