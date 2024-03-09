import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothConnectPage extends StatefulWidget {
  @override
  _BluetoothConnectPageState createState() => _BluetoothConnectPageState();
}

class _BluetoothConnectPageState extends State<BluetoothConnectPage> {
  List<BluetoothDevice> devices = [];
  bool searching = false;

  @override
  void initState() {
    super.initState();
    _startScan();
    // startScanning();
    // print('deviceeeeeees');
    // print(devices);
  }

  void startScanning() async {
    await FlutterBluePlus.startScan();
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (!devices.contains(result.device)) {
          setState(() {
            devices.add(result.device);
          });
        }
      }
    });
  }

  void _startScan() {
    setState(() {
      searching = true;
    });

    var subscription = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
    print(state);
    if (state == BluetoothAdapterState.on) {
        print('bluetooth on');
    } else {
        print('bluetooth off');
    }
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Devices   🛜'),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: devices.isEmpty
          //       ? Center(
          //           child: Text(
          //             'Echec de la recherche',
          //             style: TextStyle(color: Colors.red),
          //           ),
          //         )
          //       : ListView.builder(
          //           itemCount: devices.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(devices[index].name ?? 'Unknown'),
          //               subtitle: Text(devices[index].id.toString()),
          //               onTap: () {
          //                 // Connect to the selected Bluetooth device
          //                 _connectToDevice(devices[index]);
          //               },
          //             );
          //           },
          //         ),
          // ),
        ],
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

  // @override
  // void dispose() {
  //   flutterBlue.stopScan();
  //   super.dispose();
  // }
}
