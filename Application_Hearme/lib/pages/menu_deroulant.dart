import 'package:flutter/material.dart';

import 'speech_to_text.dart'; // Importer la classe de votre page de transcription audio

class MyDropdownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
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
                'lib/assets/interrogation.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sélectionnez une option :',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              items: <String>['📝Transcription', '📉Statistiques', 'ℹ️Info']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Redirection vers la page de transcription si "Transcription" est sélectionné
                if (newValue == '📝Transcription') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TranscriptionAudioPage()),
                  );
                }
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
