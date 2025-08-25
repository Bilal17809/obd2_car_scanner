import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/dashboard/control/dashboard_controller.dart';
import '/pages/home/view/home_view.dart';
import '/pages/live_data/live_data_view/live_data_view.dart';
import '/pages/setting/setting_view/setting_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.find<DashboardController>();

    final List<Widget> screens=[
      HomeView(),
      LiveDataView(),
      SettingView()
    ];

    return Obx((){
      return Scaffold(
        body:screens[controller.setIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.setIndex.value,
          onTap: controller.trackIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: "Live Data"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      );
    });
  }
}
