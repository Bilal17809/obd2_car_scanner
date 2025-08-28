
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/bluetooth_connection/view/bluetooth_view.dart';
import '../../main_appbar/main_appbar.dart';
import '/pages/home/widgets/widgets.dart';
import '/core/theme/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteF7,
      appBar: const MainAppBar(
        isBackButton: false,
        title: 'Car Scanner',
        subtitle: 'Scan your all Car Sensors',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20,vertical: 20),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final item = homeItems[index];
                    return HomeFeatureItem(
                      image: item["image"]!,
                      label: item["name"]!,
                      onTap: () {},
                    );
                  },
                  childCount: homeItems.length,
                ),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Obd2Data(),
              ),

              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ConnectionButton(
                      onTap: () => Get.to(() => BluetoothView()),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


