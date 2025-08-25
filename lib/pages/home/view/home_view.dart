
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import '../control/home_control.dart';
class HomeView extends StatelessWidget {
  final ObdController controller = Get.find<ObdController>();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OBD2 Scanner")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(() {
          if (controller.bluetoothState.value != BluetoothState.STATE_ON) {
            return Center(child: Text("Please enable Bluetooth"));
          }

          if (controller.devicesList.isEmpty) {
            return Center(child: Text("No paired devices found"));
          }

          return ListView.separated(
            itemCount: controller.devicesList.length + 1,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (context, index) {
              if (index == 0) {
                // Header
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Paired Devices",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                );
              }

              final device = controller.devicesList[index - 1];
              final isConnected = controller.isConnected.value &&
                  controller.connection?.isConnected == true;

              return ListTile(
                title: Text(device.name ?? "Unknown device"),
                subtitle: Text(device.address),
                trailing: ElevatedButton(
                  onPressed: isConnected
                      ? null
                      : () => controller.connectToDevice(device),
                  child: Text(isConnected ? "Connected" : "Connect"),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

// class HomeView extends StatelessWidget {
//   final controller = Get.find<ObdController>();
//
//    HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("OBD2 Scanner")),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child:
//         Obx(() => Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Paired Devices", style: TextStyle(fontWeight: FontWeight.bold)),
//             ...controller.pairedDevices.map((device) => ListTile(
//               title: Text(device.name ?? "Unknown"),
//               subtitle: Text(device.address),
//               trailing: ElevatedButton(
//                 onPressed: () => controller.connectToDevice(device),
//                 child: Text("Connect"),
//               ),
//             )),
//
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => controller.startScan(),
//               child: Text("Scan Bluetooth Devices"),
//             ),
//
//             const SizedBox(height: 20),
//             Text("Discovered Devices", style: TextStyle(fontWeight: FontWeight.bold)),
//             ...controller.scannedDevices.map((device) => ListTile(
//               title: Text(device.name ?? "Unknown"),
//               subtitle: Text(device.address),
//               trailing: ElevatedButton(
//                 onPressed: () => controller.connectToDevice(device),
//                 child: Text("Connect"),
//               ),
//             )),
//
//             const SizedBox(height: 20),
//             Text("Data", style: TextStyle(fontWeight: FontWeight.bold)),
//             Text("Connected: ${controller.isConnected.value}"),
//             Text("RPM: ${controller.rpm.value.toStringAsFixed(0)}"),
//             Text("Speed: ${controller.speed.value.toStringAsFixed(0)} km/h"),
//
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () => controller.sendCommand("010C"), // RPM
//                   child: Text("Get RPM"),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => controller.sendCommand("010D"), // Speed
//                   child: Text("Get Speed"),
//                 ),
//               ],
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

