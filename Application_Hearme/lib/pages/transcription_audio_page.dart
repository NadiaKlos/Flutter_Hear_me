import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TranscriptionAudioPage extends StatefulWidget {
  @override
  _TranscriptionAudioPageState createState() => _TranscriptionAudioPageState();
}

class _TranscriptionAudioPageState extends State<TranscriptionAudioPage> {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(height: 20), // Espace entre le titre et l'image
            Text('Transcription Audio en Texte'),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(320), // Taille de l'image réduite
          child: Image.asset(
            'lib/assets/audi_en_texte.png',
            height: 300, // Taille de l'image réduite
            width: 300, // Taille de l'image réduite
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _listen,
              child: Text(_isListening ? 'Arrêter' : 'Commencer la transcription'),
            ),
            SizedBox(height: 20),
            Text('Texte transcrit : $_text'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _transcribeViaBluetooth,
              child: Text('Connexion via Bluetooth'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _transcribeViaBluetooth,
        child: Icon(Icons.bluetooth),
      ),
    );
  }

  void _transcribeViaBluetooth() {
    // Code pour afficher les réseaux Bluetooth disponibles et se connecter
    // Vous pouvez utiliser les plugins Bluetooth Flutter pour cela
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize(
        onStatus: (status) => print('Status: $status'),
        onError: (error) => print('Error: $error'),
      );

      if (available) {
        setState(() {
          _isListening = true;
        });
        _speechToText.listen(
          onResult: (result) => setState(() {
            _text = result.recognizedWords;
          }),
          listenFor: Duration(minutes: 1),
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _speechToText.stop();
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: TranscriptionAudioPage(),
  ));
}