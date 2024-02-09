import 'package:flutter/material.dart';

class MyDropdownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu déroulant'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[100], // Fond bleu clair
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200, // Hauteur de l'image
              child: Image.asset(
                'lib/assets/interrogation.png', // Remplacez 'assets/image.png' par le chemin de votre image
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sélectionnez une option :',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              items: <String>['Transcription', 'Statistiques', 'Info']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Ajoutez ici la logique pour gérer la sélection de l'option
                print('Option sélectionnée : $newValue');
              },
              hint: Text('Sélectionnez une option'),
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyDropdownPage(),
  ));
}
