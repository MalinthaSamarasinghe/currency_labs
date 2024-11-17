import '../../../../utils/font.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';

class CurrencyCard extends StatelessWidget {
  final bool isDarkMode;
  final Country selectedCountry;
  final void Function(Country country)? onTapCurrency;
  final bool isEnabled;
  final TextEditingController? textController;
  final String? hint;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;

  const CurrencyCard({
    super.key,
    required this.isDarkMode,
    required this.selectedCountry,
    this.onTapCurrency,
    this.isEnabled = false,
    this.textController,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.autofillHints,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatter,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: kColorCard,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              enabled: isEnabled,
              controller: textController,
              focusNode: focusNode,
              textCapitalization: textCapitalization,
              keyboardType: keyboardType,
              autofillHints: autofillHints,
              textInputAction: textInputAction,
              inputFormatters: inputFormatter,
              onChanged: (text) {
                if (onChanged != null) {
                  onChanged!(text);
                }
              },
              onFieldSubmitted: onSubmitted,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.start,
              style: kOpenSans600(context, color: kColorWhite.withOpacity(0.9), fontSize: 24.sp),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: kOpenSans600(context, color: kColorWhite.withOpacity(0.9), fontSize: 24.sp),
                isDense: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          InkWell(
            onTap: () => _openCurrencyPickerDialog(context),
            child: SizedBox(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 18.5.w,
                    height: 18.5.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.antiAlias,
                    child: Center(child: CountryPickerUtils.getDefaultFlagImage(selectedCountry)),
                  ),
                  SizedBox(width: 10.w),
                  AutoSizeText(
                    "${selectedCountry.currencyCode}",
                    style: kOpenSans500(context, color: isDarkMode ? kColorWhite.withOpacity(0.9) : kColorBlack, fontSize: 17.sp),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    minFontSize: 17,
                    maxLines: 2,
                  ),
                  SizedBox(width: 6.w),
                  SvgPicture.asset(
                    "assets/svg/arrow_down.svg",
                    width: 16.w,
                    height: 16.w,
                    colorFilter: ColorFilter.mode(kColorWhite.withOpacity(0.6), BlendMode.srcIn),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _openCurrencyPickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(primaryColor: kColorBlack),
          child: CurrencyPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: kColorBlack,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your Currency'),
            onValuePicked: (Country country) {
              onTapCurrency?.call(country);
            },
            itemBuilder: (country) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CountryPickerUtils.getDefaultFlagImage(country),
                  SizedBox(width: 10.w),
                  AutoSizeText(
                    "(${country.currencyCode})",
                    style: kOpenSans600(context, color: kColorBlack, fontSize: 14.5.sp),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    minFontSize: 14,
                    maxLines: 2,
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 170.w,
                    child: AutoSizeText(
                      "${country.name}",
                      style: kOpenSans600(context, color: kColorBlack, fontSize: 14.5.sp),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      minFontSize: 14,
                      maxLines: 1,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
