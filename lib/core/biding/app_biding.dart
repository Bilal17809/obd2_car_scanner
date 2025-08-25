import 'package:get/get.dart';

import '/pages/home/control/home_control.dart';

class ObdBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ObdController());
  }
}
