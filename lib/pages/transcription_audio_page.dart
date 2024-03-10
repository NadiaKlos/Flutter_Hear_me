import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'bluetooth.dart'; // Import the file where the BluetoothConnectPage class is located

class TranscriptionAudioPage extends StatefulWidget {
  @override
  _TranscriptionAudioPageState createState() => _TranscriptionAudioPageState();
}

class _TranscriptionAudioPageState extends State<TranscriptionAudioPage> {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListening = false;
    bool isBluetoothActivated = false;
  String _text = '';

  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

  late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _adapterStateStateSubscription.cancel();
    super.dispose();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return isBluetoothActivated
            ? AlertDialog(
                title: const Text('Etat bluetooth'),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('✅Le bluetooth est déjà activé. Connectez-vous maintenant au périphérique que vous souhaitez.'),
                      Text('Vous pouvez vous connecter au périphérique Bluetooth que vous souhaitez.'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: const Text('Etat bluetooth'),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text("❌Le bluetooth n'est pas encore activé !"),
                      Text("Veuillez l'activer dans les paramètres et vous connecter au périphérique souhaité."),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
      },
    );
  }

  void _startScan() async{
    print('starttttt');
    //var subscription =
        FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      print('stateeeeee $state');
      if (state == BluetoothAdapterState.on) {
        print('bluetooth on');
        setState(() {
          isBluetoothActivated = true;
        });
      } else {
        print('bluetooth off');
        setState(() {
          isBluetoothActivated = false;
        });
      }
    });
    await Future.delayed(const Duration( milliseconds: 300));
    _showMyDialog();
    // subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final bluetoothConnectPage =
        BluetoothConnectPage(); // Create an instance of the new BluetoothConnectPage

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(height: 20), // Space between the title and the image
            Text('Transcription Audio en Texte'),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(320), // Reduced image size
          child: Image.asset(
            'lib/assets/audi_en_texte.png',
            height: 300, // Reduced image size
            width: 300, // Reduced image size
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Space between the image and the button
              ElevatedButton(
                onPressed: _listen,
                child: Text(
                    _isListening ? 'Arrêter' : 'Commencer la transcription'),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Texte transcrit : $_text',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _clearText,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.red), // Red background color for the button
                ),
                child: Text('Effacer le texte transcrit'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startScan();

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => bluetoothConnectPage),
          // );
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
              _listen(); // Recursive call to continue listening
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

  void _clearText() {
    setState(() {
      _text = '';
    });
  }
}
