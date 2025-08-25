import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NoDataFound extends StatelessWidget {
  final String description;

  const NoDataFound({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/empty_page.json', width: 200, height: 180),
          Text(
            description,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
