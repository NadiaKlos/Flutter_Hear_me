import 'package:flutter/material.dart';
import 'package:flutter_speech_to_text_tutorial/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '(H)ear-me app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('(H)ear-me app'),
          // Modifier le leading avec votre nouvelle image d'icône
          leading: Image.asset(
            'lib/assets/ecoute_logo.png', // Chemin de votre nouvelle image
            width: 40, // Largeur de l'icône
            height: 40, // Hauteur de l'icône
            fit: BoxFit.cover, // Ajuster la taille de l'icône
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}
