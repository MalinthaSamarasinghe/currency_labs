import '../../utils/font.dart';
import '../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBar {
  showSnackBar(
    BuildContext context, {
    required String msg,
    required SnackBarTypes snackBarTypes,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      width: double.infinity,
      duration: const Duration(milliseconds: 1300),
      content: CustomSnackBarContent(
        message: msg,
        snackBarTypes: snackBarTypes,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class CustomSnackBarContent extends StatelessWidget {
  final String message;
  final SnackBarTypes snackBarTypes;

  const CustomSnackBarContent({
    super.key,
    required this.message,
    required this.snackBarTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(26.w, 0, 26.w, 15.h),
      padding: EdgeInsets.fromLTRB(14.w, 12.h, 9.w, 12.h),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: snackBarTypes.backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            offset: Offset(0, 4),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            snackBarTypes.prefixIcon,
            width: 20.w,
            height: 20.w,
            colorFilter: ColorFilter.mode(snackBarTypes.iconColor, BlendMode.srcIn),
          ),
          SizedBox(width: 11.w),
          Container(
            constraints: BoxConstraints(maxWidth: 255.w),
            child: AutoSizeText(
              message,
              style: kOpenSans500(context, color: snackBarTypes.iconColor, fontSize: 12.sp),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              minFontSize: 12,
              maxLines: 2,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: SvgPicture.asset(
              snackBarTypes.suffixIcon,
              width: 24.w,
              height: 24.w,
              colorFilter: ColorFilter.mode(snackBarTypes.iconColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}

class SnackBarTypes {
  final String prefixIcon;
  final String suffixIcon;
  final Color iconColor;
  final Color backgroundColor;

  SnackBarTypes(this.prefixIcon, this.suffixIcon, this.iconColor, this.backgroundColor);

  static SnackBarTypes error = SnackBarTypes("assets/svg/warning.svg", "assets/svg/close.svg", kColorWhite, kColorSnackBar);
  static SnackBarTypes alert = SnackBarTypes("assets/svg/warning.svg", "assets/svg/close.svg", kColorBlack, kColorWhite);
  static SnackBarTypes success = SnackBarTypes("assets/svg/done_filled_circle.svg", "assets/svg/close.svg", kColorWhite, kColorGreen);
}
