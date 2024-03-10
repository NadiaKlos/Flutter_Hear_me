import 'package:flutter/material.dart';

import 'info.dart'; // Importer la classe de votre page d'informations
import 'statistics.dart'; // Importer la classe de votre page de statistiques
import 'transcription_audio_page.dart'; // Importer la classe de votre page de transcription audio

class MyDropdownPage extends StatefulWidget {
  @override
  _MyDropdownPageState createState() => _MyDropdownPageState();
}

class _MyDropdownPageState extends State<MyDropdownPage> {
  //int totalConnections = 0;
  //int successfulConnections = 0;
  //int failedConnections = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300, 
              child: Image.asset(
                'lib/assets/interrogation.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Que souhaitez-vous faire maintenant ? :',
              style: TextStyle(fontSize:16),
            ),
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              items: <String>['📝 Transcription', '❓Le saviez-vous ?', '📞Contactez-nous']
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
                // Redirection vers la page d'informations si "📞Contactez-nous" est sélectionné
                else if (newValue == '📞Contactez-nous') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()),
                  );
                }
                // Redirection vers la page de statistiques si "❓Le saviez-vous ?" est sélectionné
                else if (newValue == '❓Le saviez-vous ?') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StatisticsPage(
                      //totalConnections: totalConnections,
                      //successfulConnections: successfulConnections,
                      //failedConnections: failedConnections,
                    )),
                  );
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                hintText: 'Sélectionnez une option',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(0, 0, 0, 0),
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromARGB(0, 0, 0, 0),
                    width: 2.0,
                  ),
                ),
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
