
import 'package:flutter/cupertino.dart';

class backgroundColor extends StatelessWidget {
  final Widget widget;
  const backgroundColor({super.key,required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [
        Color(0xffA5CDE1),
    // Color(0xffD4E6F3),
    Color(0xff5CAFD5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
    ),

    ),
    child: widget
    );
  }
}
