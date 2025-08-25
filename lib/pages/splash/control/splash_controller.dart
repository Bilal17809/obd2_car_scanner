
import 'package:get/get.dart';
import '/pages/dashboard/view/dashboard_view.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3),(){
      Get.to(DashboardView());
    });
  }

}