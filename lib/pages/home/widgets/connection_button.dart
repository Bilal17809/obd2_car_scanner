import 'package:flutter/material.dart';
import 'package:obd2_car_scanner/core/theme/theme.dart';

class ConnectionButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ConnectionButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        decoration: roundedDecoration.copyWith(
          color: skyBorderColor,
          borderRadius: BorderRadius.circular(25)
        ),
        child: TextButton(
          onPressed:onTap,
          child: const Text(
            "Connect to OBD2",
            style: TextStyle(fontSize: 16,color:kWhite),
          ),
        ),
      ),
    );
  }
}
