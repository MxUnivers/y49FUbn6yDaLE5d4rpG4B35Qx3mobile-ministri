import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(), // Indicateur de chargement circulaire
            SizedBox(height: 20.0),
            Text(
              'Chargement en cours...',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
