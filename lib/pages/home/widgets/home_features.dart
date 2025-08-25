import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obd2_car_scanner/core/theme/app_styles.dart';

class HomeFeatureItem extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback? onTap;

  const HomeFeatureItem({
    super.key,
    required this.image,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Column(
        spacing: 6,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: roundedDecoration,
              child: Image.asset(image, height: 55, width: 55, fit: BoxFit.contain)),
          Text(label, style: context.textTheme.labelMedium),
        ],
      ),
    );
  }
}
