import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        title: Text('Transcription Audio en Texte'),
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
              onPressed: _activateBluetooth,
              child: Text('Activer le Bluetooth'),
            ),
          ],
        ),
      ),
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

  void _activateBluetooth() async {
    try {
      // Activer le Bluetooth
      await BluetoothActivator.activateBluetooth();
      print('Bluetooth activé avec succès');
    } catch (e) {
      print('Erreur lors de l\'activation du Bluetooth: $e');
    }
  }
}

class BluetoothActivator {
  static const MethodChannel _channel = MethodChannel('bluetooth_activator');

  static Future<void> activateBluetooth() async {
    try {
      await _channel.invokeMethod('activateBluetooth');
    } on PlatformException catch (e) {
      throw 'Erreur lors de l\'activation du Bluetooth: ${e.message}';
    }
  }
}
