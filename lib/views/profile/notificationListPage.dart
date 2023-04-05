import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:get/get.dart";

class NotificationListPage extends StatefulWidget {
  const NotificationListPage({Key? key}) : super(key: key);

  @override
  State<NotificationListPage> createState() => _StateNotificationListPage();
}

class _StateNotificationListPage extends State<NotificationListPage> {

  final List<dynamic> notifications = [
    {"title":"Notification 1", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 2", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 3", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 4", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 5", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 6", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 7", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 8", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 9", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 10", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 11", "description":"description","datehour":"il ya 1heure"},
    {"title":"Notification 12", "description":"description","datehour":"il ya 1heure"},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            "Notications",
            style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.grey[900]),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body:
        ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 0.2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: ListTile(
                focusColor: Colors.orange[500],
                leading: Icon(Icons.notifications, color: Colors.amber,),
                title: Text(notifications[index]["title"]),
                onTap: () {

                  // action to perform when notification is tapped
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Bookmark '"+notifications[index]["title"]+"'"),
                          content: Text(notifications[index]["description"], maxLines: 5,),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[500]
                              ),
                              child: Text('Annuler'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[900]
                              ),
                              child: Text('ajouter à votre bookmark'),
                              onPressed: () {
                                // Traitez l'action ici
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );

                },
                subtitle: Text(
                    notifications[index]["description"]
                ),
                trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.withOpacity(0.1)),
                    child: IconButton(
                      onPressed: (){
                        Get.to(NotificationListPage());
                      },
                      iconSize: 20,
                      icon: Icon(Icons.notifications, color: Colors.red,),
                    )
                ),
              ),
            );
          },
        )
    );
  }





}
