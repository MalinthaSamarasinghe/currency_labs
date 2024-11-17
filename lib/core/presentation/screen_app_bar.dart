import '../../utils/font.dart';
import '../../utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasTitle;
  final Color contentColor;
  final StatusBarType statusBarType;
  final LeadingType leadingType;
  final TrailingType trailingType;
  final Function()? onLeadingPress;
  final Function()? onTrailingPress;

  const ScreenAppBar({
    super.key,
    this.title = "",
    this.hasTitle = false,
    this.contentColor = kColorWhite,
    this.statusBarType = StatusBarType.light,
    this.leadingType = LeadingType.back,
    this.trailingType = TrailingType.none,
    this.onLeadingPress,
    this.onTrailingPress,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarType == StatusBarType.light ? Brightness.light : Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      title: hasTitle
          ? AutoSizeText(
              title,
              style: kOpenSans600(context, color: contentColor, fontSize: 16.sp),
              overflow: TextOverflow.ellipsis,
              minFontSize: 16,
              maxLines: 1,
            )
          : Image.asset(
              "assets/images/app_logo.png",
              height: 44.w,
              width: 44.w,
              fit: BoxFit.cover,
            ),
      leading: leadingType == LeadingType.back
          ? Padding(
              padding: EdgeInsets.only(left: 21.w, top: 11.h, bottom: 11.h),
              child: InkWell(
                onTap: onLeadingPress,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/back_icon.svg",
                    width: 26.w,
                    height: 26.w,
                    colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
                  ),
                ),
              ),
            )
          : leadingType == LeadingType.menu
                ? Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 15.h, bottom: 23.h),
                    child: InkWell(
                      onTap: onLeadingPress,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svg/menu.svg",
                          width: 20.w,
                          height: 14.h,
                          colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
      actions: [
        trailingType == TrailingType.share
            ? IconButton(
                icon: const Icon(Icons.share_rounded),
                onPressed: onTrailingPress,
                color: contentColor,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              )
            : const SizedBox(),
      ],
    );
  }
}

enum StatusBarType { light, dark }

enum LeadingType { none, back, menu }

enum TrailingType { none, share }
