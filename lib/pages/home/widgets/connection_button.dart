import 'package:flutter/material.dart';

class ConnectionButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ConnectionButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed:onTap,
        child: const Text(
          "Connect to OBD2",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
