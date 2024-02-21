import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
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
            SizedBox(height: 20), // Espace entre l'image et le bouton
            ElevatedButton(
              onPressed: _listen,
              child: Text(_isListening ? 'Arrêter' : 'Commencer la transcription'),
            ),
            SizedBox(height: 20),
            Text('Texte transcrit : $_text'),
            SizedBox(height: 20),
            //ElevatedButton(
              //onPressed: _transcribeViaBluetooth,
              //child: Text('Connexion via Bluetooth'),
            //),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _transcribeViaBluetooth,
        child: Icon(Icons.bluetooth),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _transcribeViaBluetooth() async {
    FlutterBlue flutterBlue = FlutterBlue.instance;
  
    // Récupérer les périphériques Bluetooth disponibles
    List<BluetoothDevice> devices = [];
    flutterBlue.startScan(timeout: Duration(seconds: 60));
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        devices.add(result.device);
      }
    });

    // Arrêter la recherche après un certain temps (par exemple, 10 secondes)
    await Future.delayed(Duration(seconds: 60));
    flutterBlue.stopScan();
  
    // Afficher les périphériques Bluetooth disponibles
    for (BluetoothDevice device in devices) {
      print('Nom: ${device.name}, Adresse: ${device.id}');
      // Vous pouvez afficher ces périphériques dans une liste ou un autre widget
    }
  
    // Sélectionner un périphérique à connecter
    // Par exemple, vous pouvez afficher une liste des périphériques disponibles et permettre à l'utilisateur de sélectionner celui qu'il souhaite connecter.
    // Une fois que l'utilisateur sélectionne un périphérique, vous pouvez établir la connexion à ce périphérique.
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

void main() {
  runApp(MaterialApp(
    home: TranscriptionAudioPage(),
  ));
}
