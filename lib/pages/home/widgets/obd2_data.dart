
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../bluetooth_connection/control/bluetooth_controller.dart';

class Obd2Data extends StatelessWidget {
  const Obd2Data({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BluetoothController>();

    return Obx((){
      return Column(
        children: [
          Text("ELM Connection: ${controller.isELMConnected.value ? "Connected" : "Not Connected"}"),
          Text("ECU Connection: ${controller.isECUConnected.value ? "Connected" : "Not Connected"}"),
          Text("RPM: ${controller.rpm.value.toStringAsFixed(0)}"),
          Text("Speed: ${controller.speed.value.toStringAsFixed(0)} km/h"),
        ],
      );
    });
  }
}
