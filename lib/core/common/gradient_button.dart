import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double height;
  final List<Color> gradientColors;
  final BorderRadius borderRadius;

  const GradientButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 46,
    this.gradientColors = const [Color(0xff5C9DFF), Color(0xff3471E4)],
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          color: Color(0xff5C9DFF),
          // gradient: LinearGradient(
          //   colors: gradientColors,
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          // ),
          borderRadius: borderRadius,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff3471E4),
              width: 6,
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(minHeight: height),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
