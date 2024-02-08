import 'package:flutter/material.dart';

import 'inscription_page.dart'; // Importer la classe de votre page d'inscription
import 'login_page.dart'; // Importer la classe de votre page de connexion
import 'speech_to_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bienvenue dans votre application d'aide auditive ✨",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/ecoute_logo.png',
              width: 500,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigation vers la page de connexion
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Se connecter'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigation vers la page d'inscription
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InscriptionPage()),
                );
              },
              child: Text('S\'inscrire'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigation vers la page de transcription audio
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TranscriptionAudioPage()),
                );
              },
              child: Text('Se connecter en mode invité'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
