import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';

class MainAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final List<Widget>? actions;
  final bool isBackButton;

  const MainAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.actions,
    this.isBackButton=false
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isBackButton,
      backgroundColor: kWhite,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.headlineSmall),
          Text(subtitle, style: context.textTheme.bodySmall),
        ],
      ),
      actions: actions,
    );
  }
}
