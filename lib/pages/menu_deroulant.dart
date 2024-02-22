import 'package:flutter/material.dart';

import 'info.dart'; // Importer la classe de votre page d'informations
import 'statistics.dart'; // Importer la classe de votre page de statistiques
import 'transcription_audio_page.dart'; // Importer la classe de votre page de transcription audio

class MyDropdownPage extends StatefulWidget {
  @override
  _MyDropdownPageState createState() => _MyDropdownPageState();
}

class _MyDropdownPageState extends State<MyDropdownPage> {
  int totalConnections = 0;
  int successfulConnections = 0;
  int failedConnections = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 239, 240), 
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
              items: <String>['📝 Transcription', '📉 Statistiques', 'ℹ️ Info']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Redirection vers la page de transcription si "📝 Transcription" est sélectionné
                if (newValue == '📝 Transcription') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TranscriptionAudioPage()),
                  );
                } 
                // Redirection vers la page d'informations si "ℹ️ Info" est sélectionné
                else if (newValue == 'ℹ️ Info') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()),
                  );
                }
                // Redirection vers la page de statistiques si "📉 Statistiques" est sélectionné
                else if (newValue == '📉 Statistiques') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StatisticsPage(
                      totalConnections: totalConnections,
                      successfulConnections: successfulConnections,
                      failedConnections: failedConnections,
                    )),
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
