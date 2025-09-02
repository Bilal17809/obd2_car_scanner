import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import '../control/bluetooth_controller.dart';
import '/core/common/no_data_found.dart';
import '../../main_appbar/main_appbar.dart';
import 'package:obd2_car_scanner/core/theme/theme.dart';

// class BluetoothView extends StatelessWidget {
//    const BluetoothView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BluetoothController>();
//     return Scaffold(
//       backgroundColor: kWhiteF7,
//       appBar: const MainAppBar(
//         isBackButton: true,
//         title: 'Bluetooth Connection',
//         subtitle: 'Select your OBD2 device',
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Obx(() {
//             return CustomScrollView(
//               slivers: [
//                 const SliverToBoxAdapter(child: SizedBox(height: 12)),
//                 controller.devicesList.isEmpty
//                     ? const SliverFillRemaining(
//                   hasScrollBody: false,
//                   child: NoDataFound(description: 'No Bluetooth Found'),
//                 )
//                     : SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                       if (index == 0) {
//                         // Header
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           child: Text(
//                             "Paired Devices",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                         );
//                       }
//
//                       final device = controller.devicesList[index - 1];
//                       final isConnected = controller.isConnected.value &&
//                           (controller.connection?.isConnected ?? false);
//
//                       return Column(
//                         children: [
//                           // Text("ELM Connection: ${controller.isELMConnected.value ? "Connected" : "Not Connected"}"),
//                           // Text("ECU Connection: ${controller.isECUConnected.value ? "Connected" : "Not Connected"}"),
//                           // Text("RPM: ${controller.rpm.value.toStringAsFixed(0)}"),
//                           // Text("Speed: ${controller.speed.value.toStringAsFixed(0)} km/h"),
//                           ListTile(
//                             title: Text(device.name ?? "Unknown device"),
//                             subtitle: Text(device.address),
//                             trailing: ElevatedButton(
//                               onPressed: isConnected
//                                   ? null
//                                   : () => _showPinDialog(context, controller, device),
//
//                               // onPressed: isConnected
//                               //     ? null
//                               //     : () => controller.connectToDevice(device),
//                               child: Text(
//                                 isConnected ? "Connected" : "Connect",
//                               ),
//                             ),
//                           ),
//                           const Divider(height: 1),
//                         ],
//                       );
//                     },
//                     childCount: controller.devicesList.length + 1,
//                   ),
//                 ),
//
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// void _showPinDialog(
//     BuildContext context,
//     BluetoothController controller,
//     BluetoothDevice device,
//     ) {
//   final TextEditingController pinController = TextEditingController();
//   final isLoading = false.obs;
//
//   Get.dialog(
//     Obx(() => AlertDialog(
//       title: const Text("Enter OBD2 PIN"),
//       content: isLoading.value
//           ? Column(
//         mainAxisSize: MainAxisSize.min,
//         children: const [
//           SizedBox(height: 20),
//           CircularProgressIndicator(),
//           SizedBox(height: 20),
//           Text("Connecting to device..."),
//         ],
//       )
//           : TextField(
//         controller: pinController,
//         keyboardType: TextInputType.number,
//         decoration: const InputDecoration(hintText: "e.g., 1234"),
//       ),
//       actions: isLoading.value
//           ? []
//           : [
//         TextButton(
//           onPressed: () => Get.back(),
//           child: const Text("Cancel"),
//         ),
//         TextButton(
//           onPressed: () async {
//             final pin = pinController.text.trim();
//
//             if (pin.isEmpty) {
//               Get.snackbar("PIN Required", "Please enter the PIN for your OBD2 device.");
//               return;
//             }
//
//             isLoading.value = true;
//
//             final success = await controller.connectToDevice(device);
//
//             Get.back();
//
//             if (!success) {
//               Get.snackbar(
//                 "Connection Failed",
//                 "Failed to connect to ${device.name}",
//                 snackPosition: SnackPosition.BOTTOM,
//               );
//             } else {
//               Get.snackbar(
//                 "Connected",
//                 "Successfully connected to ${device.name}",
//                 snackPosition: SnackPosition.BOTTOM,
//               );
//             }
//           },
//           child: const Text("Connect"),
//         ),
//       ],
//     )),
//     barrierDismissible: false,
//   );
// }


import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import '../control/bluetooth_controller.dart';
import '/core/common/no_data_found.dart';
import '../../main_appbar/main_appbar.dart';
import 'package:obd2_car_scanner/core/theme/theme.dart';

class BluetoothView extends StatelessWidget {
  const BluetoothView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BluetoothController>();
    return Scaffold(
      backgroundColor: kWhiteF7,
      appBar: const MainAppBar(
        isBackButton: true,
        title: 'Bluetooth Connection',
        subtitle: 'Select your OBD2 device',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx(() {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 12)),
                controller.devicesList.isEmpty
                    ? const SliverFillRemaining(
                  hasScrollBody: false,
                  child: NoDataFound(description: 'No Bluetooth Found'),
                )
                    : SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Available Devices",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        );
                      }

                      final device = controller.devicesList[index - 1];
                      final isConnected = controller.isConnected.value &&
                          controller.device?.remoteId ==
                              device.remoteId;

                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              device.platformName.isNotEmpty
                                  ? device.platformName
                                  : "Unknown device",
                            ),
                            subtitle: Text(device.remoteId.str),
                            trailing: ElevatedButton(
                              onPressed: isConnected
                                  ? null
                                  : () => controller.connectToDevice(device),
                              child: Text(
                                isConnected ? "Connected" : "Connect",
                              ),
                            ),
                          ),
                          const Divider(height: 1),
                        ],
                      );
                    },
                    childCount: controller.devicesList.length + 1,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
