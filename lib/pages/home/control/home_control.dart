import 'dart:convert';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ObdController extends GetxController {
  final bluetoothState = BluetoothState.UNKNOWN.obs;
  final devicesList = <BluetoothDevice>[].obs;
  final isConnected = false.obs;
  BluetoothConnection? connection;

  @override
  void onInit() {
    super.onInit();
    FlutterBluetoothSerial.instance.state.then((state) async {
      bluetoothState.value = state;
      if (state == BluetoothState.STATE_ON) {
        await requestPermissions();
        getBondedDevices();
      }
    });

    FlutterBluetoothSerial.instance.onStateChanged().listen((state) async {
      bluetoothState.value = state;
      if (state == BluetoothState.STATE_ON) {
        await requestPermissions();
        getBondedDevices();
      } else {
        devicesList.clear();
      }
    });
  }

  Future<void> requestPermissions() async {
    if (await Permission.bluetoothConnect.isDenied) {
      await Permission.bluetoothConnect.request();
    }

    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }

    // You can check permission status and handle accordingly
    if (!(await Permission.bluetoothConnect.isGranted)) {
      Get.snackbar("Permission Required", "Bluetooth Connect permission is needed to get paired devices",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getBondedDevices() async {
    try {
      var bonded = await FlutterBluetoothSerial.instance.getBondedDevices();
      devicesList.value = bonded;
      print("Paired devices found: ${bonded.length}");
    } catch (e) {
      print("Error getting bonded devices: $e");
    }
  }
  void connectToDevice(BluetoothDevice device) async {
    try {
      connection = await BluetoothConnection.toAddress(device.address);
      isConnected.value = true;
      print('Connected to ${device.name}');
      // ... your input listening here
    } catch (e) {
      print('Error connecting: $e');
      Get.snackbar("Connection Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void disconnect() {
    connection?.dispose();
    connection = null;
    isConnected.value = false;
    print("Disconnected");
  }
// connectToDevice and disconnect methods unchanged
}

// class ObdController extends GetxController {
//   final bluetoothState = BluetoothState.UNKNOWN.obs;
//   final devicesList = <BluetoothDevice>[].obs;
//   final isConnected = false.obs;
//   BluetoothConnection? connection;
//
//   final rpm = 0.0.obs;
//   final speed = 0.0.obs;
//
//   String buffer = ''; // buffer to accumulate incoming data
//
//   @override
//   void onInit() {
//     super.onInit();
//     FlutterBluetoothSerial.instance.state.then((state) {
//       bluetoothState.value = state;
//     });
//     getBondedDevices();
//   }
//
//   void getBondedDevices() async {
//     devicesList.value = await FlutterBluetoothSerial.instance.getBondedDevices();
//   }
//
//   void connectToDevice(BluetoothDevice device) async {
//     try {
//       connection = await BluetoothConnection.toAddress(device.address);
//       isConnected.value = true;
//
//       connection!.input!.listen((data) {
//         buffer += utf8.decode(data);
//
//         // Print raw incoming data
//         print("Raw data chunk: $buffer");
//
//         // If we detect '>' prompt, assume response complete
//         if (buffer.contains('>')) {
//           parseOBDResponse(buffer);
//           buffer = ''; // clear buffer for next response
//         }
//       });
//     } catch (e) {
//       print("Connection Error: $e");
//       Get.snackbar("Connection Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
//     }
//   }
//
//   void sendCommand(String cmd) {
//     if (connection != null && isConnected.value) {
//       print("Sending command: $cmd");
//       connection!.output.add(utf8.encode('$cmd\r'));
//       connection!.output.allSent;
//     } else {
//       print("Cannot send command, not connected.");
//       Get.snackbar("Error", "Not connected to any device", snackPosition: SnackPosition.BOTTOM);
//     }
//   }
//
//   void parseOBDResponse(String response) {
//     print("Parsing response: $response");
//
//     // Clean response to keep only hex digits and spaces
//     String cleanResp = response.replaceAll(RegExp(r'[^A-Fa-f0-9 ]'), '').trim();
//     final parts = cleanResp.split(' ');
//
//     if (parts.length < 4 || parts[0] != '41') {
//       print("Response format unexpected: $cleanResp");
//       return;
//     }
//
//     try {
//       if (parts[1] == '0C') {
//         // RPM
//         int A = int.parse(parts[2], radix: 16);
//         int B = int.parse(parts[3], radix: 16);
//         rpm.value = ((A * 256) + B) / 4;
//         print("RPM updated: ${rpm.value}");
//       } else if (parts[1] == '0D') {
//         // Speed
//         int A = int.parse(parts[2], radix: 16);
//         speed.value = A.toDouble();
//         print("Speed updated: ${speed.value}");
//       }
//     } catch (e) {
//       print("Error parsing OBD response: $e");
//       Get.snackbar("Parsing Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
//     }
//   }
//
//   void startScan() {
//     devicesList.clear(); // clear current list
//
//     FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
//       final device = r.device;
//       // Add the device if not already in list
//       if (!devicesList.any((d) => d.address == device.address)) {
//         devicesList.add(device);
//       }
//     }).onDone(() {
//       print("Scan completed.");
//       Get.snackbar("Scan", "Bluetooth scan completed", snackPosition: SnackPosition.BOTTOM);
//     });
//   }
//
//
//   void disconnect() {
//     connection?.dispose();
//     connection = null;
//     isConnected.value = false;
//     print("Disconnected from device.");
//   }
// }
