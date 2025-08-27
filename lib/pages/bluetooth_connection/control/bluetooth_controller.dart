
import 'dart:convert';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
// class BluetoothController extends GetxController {
//   final bluetoothState = BluetoothState.UNKNOWN.obs;
//   final devicesList = <BluetoothDevice>[].obs;
//   final isConnected = false.obs;
//   final isELMConnected = false.obs;
//   final isECUConnected = false.obs;
//
//   BluetoothConnection? connection;
//   final rpm = 0.0.obs;
//   final speed = 0.0.obs;
//
//   String buffer = '';
//
//   @override
//   void onInit() {
//     super.onInit();
//     _initBluetooth();
//   }
//
//   void _initBluetooth() async {
//     bluetoothState.value = await FlutterBluetoothSerial.instance.state;
//
//     if (bluetoothState.value == BluetoothState.STATE_ON) {
//       await requestPermissions();
//       await getBondedDevices();
//       startDiscovery(); // Start scanning
//     }
//
//     FlutterBluetoothSerial.instance.onStateChanged().listen((state) async {
//       bluetoothState.value = state;
//       if (state == BluetoothState.STATE_ON) {
//         await requestPermissions();
//         await getBondedDevices();
//         startDiscovery();
//       } else {
//         devicesList.clear();
//       }
//     });
//   }
//
//   Future<void> requestPermissions() async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.bluetoothScan,
//       Permission.bluetoothConnect,
//       Permission.locationWhenInUse,
//     ].request();
//
//     if (statuses.values.any((status) => status != PermissionStatus.granted)) {
//       Get.snackbar("Permissions Required", "Bluetooth and location permissions must be granted.",
//           snackPosition: SnackPosition.BOTTOM);
//     } else {
//       print("✅ All permissions granted");
//     }
//   }
//
//   Future<void> getBondedDevices() async {
//     try {
//       final bonded = await FlutterBluetoothSerial.instance.getBondedDevices();
//       for (var d in bonded) {
//         if (!_isAlreadyInList(d) && _isOBDDevice(d)) {
//           devicesList.add(d);
//         }
//       }
//       print("✅ Paired devices found: ${bonded.length}");
//     } catch (e) {
//       print("❌ Error getting bonded devices: $e");
//     }
//   }
//
//   void startDiscovery() {
//     FlutterBluetoothSerial.instance.cancelDiscovery();
//     FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
//       final device = r.device;
//       if (!_isAlreadyInList(device) && _isOBDDevice(device)) {
//         print("📡 Found OBD device: ${device.name} - ${device.address}");
//         devicesList.add(device);
//       }
//     });
//   }
//
//   bool _isAlreadyInList(BluetoothDevice device) {
//     return devicesList.any((d) => d.address == device.address);
//   }
//
//   bool _isOBDDevice(BluetoothDevice device) {
//     final name = device.name?.toLowerCase() ?? '';
//     return name.contains('obd') || name.contains('elm') || name.contains('car') || name.contains('bafx');
//   }
//
//   void connectToDevice(BluetoothDevice device) async {
//     try {
//       await FlutterBluetoothSerial.instance.cancelDiscovery();
//       print("🔁 Discovery canceled");
//       await Future.delayed(Duration(seconds: 2));
//
//       print('########### 🔌 Connecting to: ${device.name}, ${device.address}');
//       connection = await BluetoothConnection.toAddress(device.address);
//
//       isConnected.value = true;
//       isELMConnected.value = true;
//
//       print('######## ✅ Connected to ${device.name}');
//
//       connection!.input!.listen((data) {
//         buffer += utf8.decode(data);
//         print("📥 Raw data: $buffer");
//
//         if (buffer.contains('>')) {
//           parseOBDResponse(buffer);
//           buffer = '';
//         }
//       });
//
//       Future.delayed(const Duration(seconds: 2), () {
//         sendCommand("0100"); // ECU test
//       });
//
//     } catch (e) {
//       print('❌ Connection error: $e');
//       isConnected.value = false;
//       isELMConnected.value = false;
//
//       Get.snackbar("Connection Error", "Could not connect to ${device.name}",
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }
//
//   void sendCommand(String cmd) {
//     if (connection != null && isConnected.value) {
//       print("➡️ Sending: $cmd");
//       connection!.output.add(utf8.encode('$cmd\r'));
//       connection!.output.allSent;
//     } else {
//       print("⚠️ Not connected.");
//     }
//   }
//
//   void parseOBDResponse(String response) {
//     print("🔍 Parsing response: $response");
//     final clean = response.replaceAll(RegExp(r'[^A-Fa-f0-9 ]'), '').trim();
//     final parts = clean.split(' ');
//
//     if (parts.length < 2 || parts[0] != '41') {
//       print("⚠️ Invalid response");
//       return;
//     }
//
//     isECUConnected.value = true;
//
//     try {
//       if (parts[1] == '0C' && parts.length >= 4) {
//         int A = int.parse(parts[2], radix: 16);
//         int B = int.parse(parts[3], radix: 16);
//         rpm.value = ((A * 256) + B) / 4;
//         print("🔁 RPM: ${rpm.value}");
//       } else if (parts[1] == '0D' && parts.length >= 3) {
//         int A = int.parse(parts[2], radix: 16);
//         speed.value = A.toDouble();
//         print("🏁 Speed: ${speed.value}");
//       }
//     } catch (e) {
//       print("❌ Parsing error: $e");
//     }
//   }
//
//   void disconnect() {
//     connection?.dispose();
//     connection = null;
//     isConnected.value = false;
//     isELMConnected.value = false;
//     isECUConnected.value = false;
//     print("⛔ Disconnected");
//   }
// }


class BluetoothController extends GetxController {
  final bluetoothState = BluetoothState.UNKNOWN.obs;
  final devicesList = <BluetoothDevice>[].obs;

  final isConnected = false.obs;
  final isELMConnected = false.obs;
  final isECUConnected = false.obs;

  BluetoothConnection? connection;

  final rpm = 0.0.obs;
  final speed = 0.0.obs;

  String buffer = '';

  @override
  void onInit() {
    super.onInit();
    _initializeBluetooth();
  }

  void _initializeBluetooth() async {
    bluetoothState.value = await FlutterBluetoothSerial.instance.state;

    if (bluetoothState.value == BluetoothState.STATE_ON) {
      await requestPermissions();
      getBondedDevices();
    }

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

  /// Request required permissions
  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse,
    ].request();

    if (statuses[Permission.bluetoothScan] != PermissionStatus.granted ||
        statuses[Permission.bluetoothConnect] != PermissionStatus.granted ||
        statuses[Permission.locationWhenInUse] != PermissionStatus.granted) {
      Get.snackbar(
        "Permissions Required",
        "All permissions must be granted to connect.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      print("✅ All permissions granted");
    }
  }

  void getBondedDevices() async {
    devicesList.clear();

    try {
      // First get bonded (paired) devices
      final bonded = await FlutterBluetoothSerial.instance.getBondedDevices();
      print("✅ Paired devices: ${bonded.length}");

      // Add bonded devices to the list
      devicesList.addAll(bonded);

      // Now start discovery for nearby (unpaired) devices
      FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
        final device = r.device;

        // Only add if it's not already in the list
        final exists = devicesList.any((d) => d.address == device.address);
        if (!exists) {
          print("🛰️ Found nearby: ${device.name} - ${device.address}");
          devicesList.add(device);
        }
      }).onDone(() {
        print("🔍 Discovery completed.");
      });
    } catch (e) {
      print("❌ Error getting devices: $e");
    }
  }

  /// Get all paired devices
  // void getBondedDevices() async {
  //   try {
  //     final bonded = await FlutterBluetoothSerial.instance.getBondedDevices();
  //     devicesList.assignAll(bonded);
  //     print("✅ Paired devices found: ${bonded.length}");
  //   } catch (e) {
  //     print("########### ❌ Error getting bonded devices: $e");
  //   }
  // }

  void connectToDevice(BluetoothDevice device) async {
    try {
      await FlutterBluetoothSerial.instance.cancelDiscovery();
      print("🔁 Discovery canceled");

      // Wait to ensure stability
      await Future.delayed(Duration(seconds: 2));

      print('########### 🔌 Connecting to: ${device.name}, ${device.address}');

      connection = await BluetoothConnection.toAddress(
        device.address,
      );

      isConnected.value = true;
      isELMConnected.value = true;

      print('✅ Connected to ${device.name}');

      connection!.input!.listen((data) {
        buffer += utf8.decode(data);
        print("📥 Raw data: $buffer");

        if (buffer.contains('>')) {
          parseOBDResponse(buffer);
          buffer = '';
        }
      });

      Future.delayed(const Duration(seconds: 2), () {
        sendCommand("0100"); // Basic ECU test
      });

    } catch (e) {
      print('❌ Connection error: $e');
      isConnected.value = false;
      isELMConnected.value = false;

      Get.snackbar(
        "Connection Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  /// Send command to ELM327
  void sendCommand(String cmd) {
    if (connection != null && isConnected.value) {
      print("➡️ Sending: $cmd");
      connection!.output.add(utf8.encode('$cmd\r'));
      connection!.output.allSent;
    } else {
      print("⚠️ Not connected.");
      Get.snackbar(
        "Error",
        "Not connected to any device",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Parse OBD response
  void parseOBDResponse(String response) {
    print("🔍 Parsing response: $response");

    final cleanResp = response.replaceAll(RegExp(r'[^A-Fa-f0-9 ]'), '').trim();
    final parts = cleanResp.split(' ');

    if (parts.length < 2 || parts[0] != '41') {
      print("############## ⚠️ Invalid ECU response: $cleanResp");
      return;
    }

    isECUConnected.value = true;

    try {
      if (parts[1] == '0C' && parts.length >= 4) {
        int A = int.parse(parts[2], radix: 16);
        int B = int.parse(parts[3], radix: 16);
        rpm.value = ((A * 256) + B) / 4;
        print("🔁 RPM: ${rpm.value}");
      } else if (parts[1] == '0D' && parts.length >= 3) {
        int A = int.parse(parts[2], radix: 16);
        speed.value = A.toDouble();
        print("🏁 Speed: ${speed.value}");
      }
    } catch (e) {
      print("########### ❌ Parsing error: $e");
    }
  }

  /// Disconnect
  void disconnect() {
    connection?.dispose();
    connection = null;
    isConnected.value = false;
    isELMConnected.value = false;
    isECUConnected.value = false;
    print("⛔ Disconnected");
  }
}
