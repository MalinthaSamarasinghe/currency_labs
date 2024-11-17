import '../../../utils/font.dart';
import 'package:flutter/material.dart';
import 'package:currency_labs/utils/colors.dart';
import '../../../core/locales/locale_keys.g.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../core/presentation/screen_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvanceExchangeScreen extends StatelessWidget {
  const AdvanceExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: Scaffold(
        backgroundColor: kColorWhite,
        appBar: ScreenAppBar(
          color: kColorBlack,
          hasTitle: true,
          title: LocaleKeys.features_customer_customers.tr(),
          statusBarType: StatusBarType.dark,
          leadingType: LeadingType.back,
          trailingType: TrailingType.none,
          onLeadingPress: () {
            FocusManager.instance.primaryFocus?.unfocus();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        body: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: AutoSizeText(
                "INSERT AMOUNT :",
                style: kOpenSans500(context, color: kColorBlack, fontSize: 15.sp),
                overflow: TextOverflow.ellipsis,
                minFontSize: 15,
                maxLines: 1,
              ),
            ),
            Container(
              height: 64.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: kCardBg,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                children: [
                  AutoSizeText(
                    "INSERT AMOUNT :",
                    style: kOpenSans500(context, color: kColorBlack, fontSize: 15.sp),
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 15,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
