import '../../../../utils/font.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';

class CurrencyCard extends StatefulWidget {
  final String amount;
  final String isoCode;
  final bool isDarkMode;
  final void Function()? onTapAmount;
  final void Function()? onTapCurrency;

  const CurrencyCard({
    super.key,
    required this.amount,
    required this.isoCode,
    required this.isDarkMode,
    this.onTapAmount,
    this.onTapCurrency,
  });

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  String isoCode = "US";
  late Country _selectedDialogCurrency;

  @override
  void initState() {
    super.initState();
    if(widget.isoCode != "") {
      isoCode = widget.isoCode;
    }
    _selectedDialogCurrency = CountryPickerUtils.getCountryByIsoCode(isoCode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: kCardBg,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          AutoSizeText(
            widget.amount,
            style: kOpenSans600(context, fontSize: 24.sp),
            overflow: TextOverflow.ellipsis,
            minFontSize: 24,
            maxLines: 1,
          ),
          Spacer(),
          InkWell(
            onTap: _openCurrencyPickerDialog,
            child: SizedBox(
              width: 100.w,
              child: _buildCurrencyDialogItem(_selectedDialogCurrency),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyDialogItem(Country country) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      SizedBox(width: 10.w),
      AutoSizeText(
        "${country.currencyCode}",
        style: kOpenSans500(context, color: widget.isDarkMode ? kColorWhite : kColorBlack, fontSize: 17.sp),
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
        colorFilter: ColorFilter.mode(kColorWhite, BlendMode.srcIn),
      ),
    ],
  );

  void _openCurrencyPickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.pink),
      child: CurrencyPickerDialog(
        titlePadding: EdgeInsets.all(8.0),
        searchCursorColor: Colors.pinkAccent,
        searchInputDecoration: InputDecoration(hintText: 'Search...'),
        isSearchable: true,
        title: Text('Select your Currency'),
        onValuePicked: (Country country) {
          setState(() => _selectedDialogCurrency = country);
          debugPrint("Selected currency: ${_selectedDialogCurrency.isoCode}");
        },
        itemBuilder: (country) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountryPickerUtils.getDefaultFlagImage(country),
              SizedBox(width: 20.w),
              AutoSizeText(
                "${country.currencyCode}",
                style: kOpenSans700(context, color: kColorBlack, fontSize: 14.5.sp),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                minFontSize: 14,
                maxLines: 2,
              ),
            ],
          );
        },
      ),
    ),
  );
}
