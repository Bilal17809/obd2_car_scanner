import 'package:get/get.dart';
import 'package:obd2_car_scanner/pages/dashboard/control/dashboard_controller.dart';
import 'package:obd2_car_scanner/pages/splash/control/splash_controller.dart';
import '../../pages/setting/control/setting_controller.dart';
import '/pages/home/control/home_control.dart';

class DependencyInject{
  static void init(){
    Get.lazyPut<SplashController>(() => SplashController(),fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController(),fenix: true);
    Get.lazyPut<HomeControl>(() => HomeControl(),fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(),fenix: true);
  }
}