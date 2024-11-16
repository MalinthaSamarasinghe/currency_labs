import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Open sans
TextStyle kOpenSans400(BuildContext context, {Color color = kColorWhite, double? fontSize, double? height, TextDecoration? decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: 'Open Sans',
    color: color,
    fontSize: fontSize ?? 18.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: decoration,
    height: height,
  );
}

TextStyle kOpenSans500(BuildContext context, {Color color = kColorWhite, double? fontSize, double? height, TextDecoration? decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: 'Open Sans',
    color: color,
    fontSize: fontSize ?? 18.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: decoration,
    height: height,
  );
}

TextStyle kOpenSans600(BuildContext context, {Color color = kColorWhite, double? fontSize, double? height, TextDecoration? decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: 'Open Sans',
    color: color,
    fontSize: fontSize ?? 18.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: decoration,
    height: height,
  );
}

TextStyle kOpenSans700(BuildContext context, {Color color = kColorWhite, double? fontSize, double? height, TextDecoration? decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: 'Open Sans',
    color: color,
    fontSize: fontSize ?? 18.sp,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    decoration: decoration,
    height: height,
  );
}