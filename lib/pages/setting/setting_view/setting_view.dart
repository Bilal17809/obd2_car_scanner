import 'package:flutter/material.dart';
import '../../main_appbar/main_appbar.dart';
import '/core/theme/theme.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteF7,
      appBar: const MainAppBar(
        isBackButton: true,
        title: 'Setting',
        subtitle: '',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: CustomScrollView(),
        ),
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


