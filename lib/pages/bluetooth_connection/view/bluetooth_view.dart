import 'package:flutter/material.dart';
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
                          Text("ELM Connection: ${controller.isELMConnected.value ? "Connected" : "Not Connected"}"),
                          Text("ECU Connection: ${controller.isECUConnected.value ? "Connected" : "Not Connected"}"),
                          Text("RPM: ${controller.rpm.value.toStringAsFixed(0)}"),
                          Text("Speed: ${controller.speed.value.toStringAsFixed(0)} km/h"),
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

