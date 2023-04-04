import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class NotificationListPage extends StatefulWidget {
  const NotificationListPage({Key? key}) : super(key: key);

  @override
  State<NotificationListPage> createState() => _StateNotificationListPage();
}

class _StateNotificationListPage extends State<NotificationListPage> {
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
        body: SingleChildScrollView(
          child: Container(
            child: ListView.separated(
                itemBuilder: (context, index){
                  return listViewItem(index);
                },
              separatorBuilder: (context, index){
                  return Divider(height:0);
              },
              itemCount: 15,
            ),
          ),
        )
    );
  }

  Widget listViewItem (int index ){
    return Container(
      margin: EdgeInsets.only(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          message(index),
          timeAndDate(index)
        ],
      ),
    );
  }

  Widget message(int index ){
    double textSize = 14  ;
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Message",
          style: GoogleFonts.nunito(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          children: [
            TextSpan(
              text:"Message de Description",
              style:GoogleFonts.nunito(
                fontWeight: FontWeight.w400
              )
            ),

          ]
        ),
      ),
    );
  }

  Widget timeAndDate(int index){
    return Container(
      margin: EdgeInsets.only(top:5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "04-04-2023",
            style:GoogleFonts.nunito(
                fontSize:10
            )
          ),
          Text(
              "07:10 am",
              style:GoogleFonts.nunito(
                  fontSize:10
              )
          )
        ],
      ),
    );
  }


}
