import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main_appbar/main_appbar.dart';
import '../control/setting_controller.dart';
import '/core/theme/theme.dart';
import '/core/common/common.dart';

class SettingView extends StatelessWidget {
  final controller = Get.find<SettingController>();

  SettingView({super.key});

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
                        // Header
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Paired Devices",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        );
                      }

                      final device = controller.devicesList[index - 1];
                      final isConnected = controller.isConnected.value &&
                          (controller.connection?.isConnected ?? false);

                      return Column(
                        children: [
                          ListTile(
                            title: Text(device.name ?? "Unknown device"),
                            subtitle: Text(device.address),
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


