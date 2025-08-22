import 'package:flutter/material.dart';
import '../constant/constant.dart';
import 'app_colors.dart';

/*
Use all these for text style
you don't need to style the text
in Ui just call these widget in text style
*/

const TextStyle headlineMediumStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 30,
  fontWeight: FontWeight.w700,
  color: blackTextColor,
);

const TextStyle splashText = TextStyle(
  color: kWhite,
  fontSize: 34,
  fontWeight: FontWeight.bold,
  shadows: [BoxShadow(color: kBlack, blurRadius: 6)],
);

const TextStyle headlineSmallStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);

const TextStyle titleLargeStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 22,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);

const TextStyle titleMediumStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);

const TextStyle titleSmallStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);

const TextStyle bodyLargeStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const TextStyle bodyMediumStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: blackTextColor,
);

const TextStyle bodySmallStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

const TextStyle buttonTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

const TextStyle labelMediumStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);
const TextStyle labelSmallStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);
//decoration

//for premium screen
final BoxDecoration premiumscreenroundecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: greyColor.withOpacity(0.14),
);


final BoxDecoration roundedDecorationWithShadow = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withValues(alpha: 0.2),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ],
);

/*
use this for container decoration
>>> if you need extra then just context. it will
allow you all component
*/
final BoxDecoration roundedDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withValues(alpha: 0.2),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ],
);

//for home view
final BoxDecoration roundedDecorationHomevie = BoxDecoration(
  gradient: kGradient,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withValues(alpha: 0.2),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ],
);
final BoxDecoration roundedGreenBorderDecoration = BoxDecoration(
  color: greenColor.withValues(alpha: 0.3),
  borderRadius: BorderRadius.circular(10),
  border: Border.all(color: greenColor, width: 1.0),
);

//home view container decoration

final BoxDecoration rounBorderDecoration = BoxDecoration(
  color: kWhite,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(30),
    topRight: Radius.circular(30),
    bottomRight: Radius.circular(08),
    topLeft: Radius.circular(08),
  ),
  border: Border.all(color: kMintGreen),
  boxShadow: [BoxShadow(color: greyColor, blurRadius: 2)],
);

final BoxDecoration rounderGreyBorderDecoration = BoxDecoration(
  color: kWhite,
  borderRadius: BorderRadius.circular(12),
  border: Border.all(color: greyBorderColor),
);

final boxShadow = BoxShadow(
  color: Colors.grey.withValues(alpha: 0.2),
  blurRadius: 6,
  offset: Offset(0, 2),
);
