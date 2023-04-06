import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:torismo/component/LoadingPage.dart';
import 'package:torismo/views/lets_go.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  // This
  bool _isLoading = true; // Etat initial : page de chargement affichée

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // Récupérer les données ici
    await Future.delayed(Duration(seconds: 5)); // Simulation d'une requête asynchrone de 3 secondes
    setState(() {
      _isLoading = false; // Changer l'état : page de chargement masquée
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'application mobile minis',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _isLoading ? LoadingPage() : LetsGoPage()
    );
  }
}
