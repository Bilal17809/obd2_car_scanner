import 'package:get/get.dart';
import '/pages/bluetooth_connection/control/bluetooth_controller.dart';
import '/pages/dashboard/control/dashboard_controller.dart';
import '/pages/splash/control/splash_controller.dart';
import '../../pages/setting/control/setting_controller.dart';
import '/pages/home/control/home_control.dart';

class DependencyInject{
  static void init(){
    Get.lazyPut<SplashController>(() => SplashController(),fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController(),fenix: true);
    Get.lazyPut<HomeControl>(() => HomeControl(),fenix: true);
    Get.lazyPut<BluetoothController>(() => BluetoothController(),fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(),fenix: true);
  }
}