import "package:flutter/material.dart";

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .35,
                child: Column(
                  children: [
                    Container(
                      child: Text("Bookmark"),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    //VideoBookmark()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class VideoBookmark extends StatelessWidget {
  const VideoBookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Card(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: ListTile(
            onTap: () {},
            leading: Icon(Icons.play_circle_fill_outlined ,  size: 20,),
            title: Text("Videos"),
            subtitle: Text(
              '',
              maxLines: 2,
              style: TextStyle(fontSize: 12),
            ),
            trailing: Row(
              children: [
                CircleAvatar(
                  child: IconButton(
                      style: ButtonStyle(),
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle_fill,
                        color: Colors.green[700],
                      )),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  child: Text("17"),
                )
              ],
            ),
            isThreeLine: true,
          ),
        );

  }
}


