import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothConnectPage extends StatefulWidget {
  @override
  _BluetoothConnectPageState createState() => _BluetoothConnectPageState();
}

class _BluetoothConnectPageState extends State<BluetoothConnectPage> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devices = [];

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() {
    flutterBlue.startScan(timeout: Duration(seconds: 30));
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      setState(() {
        devices.clear();
        for (ScanResult result in results) {
          devices.add(result.device);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Devices   🛜'),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(devices[index].name ?? 'Unknown'),
            subtitle: Text(devices[index].id.toString()),
            onTap: () {
              // Connect to the selected Bluetooth device
              _connectToDevice(devices[index]);
            },
          );
        },
      ),
    );
  }

  void _connectToDevice(BluetoothDevice device) {
    // Implement your logic to connect to the Bluetooth device here
    print('Connecting to ${device.name}...');
    // You can use the device object to establish a connection
    // For example: device.connect();
    // Once the connection is established, you can navigate to another page or perform other actions.
  }

  @override
  void dispose() {
    flutterBlue.stopScan();
    super.dispose();
  }
}

