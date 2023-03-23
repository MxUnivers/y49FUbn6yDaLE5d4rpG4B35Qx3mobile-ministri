import "package:flutter/material.dart";


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  buildCard("titre  mon article","description l'article en question, je suis trsè content pour vous , votre artcile est très dans la plus part des "),
                  buildCard("titre  mon article","description l'article en question, je suis trsè content pour vous , votre artcile est très dans la plus part des "),
                  buildCard("titre  mon article","description l'article en question, je suis trsè content pour vous , votre artcile est très dans la plus part des "),
                  buildCard("titre  mon article","description l'article en question, je suis trsè content pour vous , votre artcile est très dans la plus part des "),
                  buildCard("titre  mon article","description l'article en question, je suis trsè content pour vous , votre artcile est très dans la plus part des "),
                ],
              )),
        ));
  }
}


Card buildCard(String title , String description) {
  var heading = title;
  var subheading = '2 bed, 1 bath, 1300 sqft';
  var cardImage = NetworkImage(
      'https://source.unsplash.com/random/800x600?house');
  var supportingText =description ;
  return Card(color: Colors.white70,
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(heading),
            subtitle: Text(subheading),
            trailing: Icon(Icons.favorite_outline),
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
                'https://source.unsplash.com/random/800x600?house',
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
                child: const Text('CONTACT AGENT'),
                onPressed: () {/* ... */},
              ),
              TextButton(
                child: const Text('LEARN MORE'),
                onPressed: () {/* ... */},
              )
            ],
          )
        ],
      ));
}





