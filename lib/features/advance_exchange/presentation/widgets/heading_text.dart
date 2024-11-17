import '../../../../utils/font.dart';
import '../../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingText extends StatelessWidget {
  final String title;
  final bool isDarkMode;

  const HeadingText({super.key, required this.title, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        title,
        style: kOpenSans700(context, color: isDarkMode ? kColorHeadings : kColorBlack, fontSize: 14.5.sp),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        minFontSize: 14,
        maxLines: 2,
      ),
    );
  }
}
