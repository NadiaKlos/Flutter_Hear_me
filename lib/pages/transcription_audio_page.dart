import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'bluetooth.dart'; // Importez le fichier où se trouve la classe BluetoothConnectPage

void main() {
  runApp(MaterialApp(
    home: TranscriptionAudioPage(),
  ));
}

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
    final bluetoothConnectPage = BluetoothConnectPage(); // Créez une instance de la nouvelle page BluetoothConnectPage

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
            SizedBox(height: 20), // Espace entre l'image et le bouton
            ElevatedButton(
              onPressed: _listen,
              child: Text(_isListening ? 'Arrêter' : 'Commencer la transcription'),
            ),
            SizedBox(height: 20),
            Text('Texte transcrit : $_text'),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => bluetoothConnectPage),
          );
        },
        child: Icon(Icons.bluetooth),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
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
          onResult: (result) {
            setState(() {
              _text = result.recognizedWords;
            });
            if (result.finalResult) {
              _listen(); // Appel récursif pour continuer à écouter
            }
          },
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
