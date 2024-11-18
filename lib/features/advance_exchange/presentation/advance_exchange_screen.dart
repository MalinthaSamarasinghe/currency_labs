import '../../../injector.dart';
import '../../../utils/font.dart';
import 'widgets/heading_text.dart';
import 'widgets/currency_card.dart';
import '../../../utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'blocs/latest_currency_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../core/enums/bloc_state_status.dart';
import '../../../core/presentation/main_button.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../core/presentation/screen_app_bar.dart';
import '../../../core/presentation/custom_snack_bar.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';

class AdvanceExchangeScreenWrapper extends StatelessWidget {
  const AdvanceExchangeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LatestCurrencyBloc>(
          create: (context) => sl<LatestCurrencyBloc>(),
        ),
      ],
      child: const AdvanceExchangeScreen(),
    );
  }
}

class AdvanceExchangeScreen extends StatefulWidget {
  const AdvanceExchangeScreen({super.key});

  @override
  State<AdvanceExchangeScreen> createState() => _AdvanceExchangeScreenState();
}

class _AdvanceExchangeScreenState extends State<AdvanceExchangeScreen> with SingleTickerProviderStateMixin {
  late final slidableController = SlidableController(this);

  @override
  void initState() {
    context.read<LatestCurrencyBloc>().baseAmountController.text = (context.read<LatestCurrencyBloc>().state.baseLatestCurrency.amount ?? 0.0).toStringAsFixed(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: Scaffold(
        backgroundColor: kColorBackground,
        appBar: ScreenAppBar(
          contentColor: kColorWhite.withOpacity(0.8),
          hasTitle: true,
          title: "Advanced Exchanger",
          statusBarType: StatusBarType.light,
          leadingType: LeadingType.back,
          trailingType: TrailingType.none,
          onLeadingPress: () {
            FocusManager.instance.primaryFocus?.unfocus();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocConsumer<LatestCurrencyBloc, LatestCurrencyState>(
            buildWhen: (prev, current) {
              if (prev.currencyStatus == BlocStateStatus.initial && current.currencyStatus == BlocStateStatus.loadInProgress) {
                return false;
              } else {
                return true;
              }
            },
            listener: (context, state) {
              if (state.currencyStatus == BlocStateStatus.loadFailure) {
                EasyLoading.dismiss();
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 100), () {
                  CustomSnackBar().showSnackBar(
                    context,
                    msg: state.errorMessage ?? "Something went wrong. Please try again later!",
                    snackBarTypes: SnackBarTypes.error,
                  );
                });
              }
              if (state.currencyStatus == BlocStateStatus.loadSuccess) {
                Navigator.pop(context);
                EasyLoading.dismiss();
              }
              if (state.currencyStatus == BlocStateStatus.loadInProgress) {
                FocusManager.instance.primaryFocus?.unfocus();
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                EasyLoading.show(status: "Please Wait", dismissOnTap: false);
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 26.h),
                  HeadingText(title: "INSERT AMOUNT : ", isDarkMode: true),
                  CurrencyCard(
                    isDarkMode: true,
                    selectedCountry: CountryPickerUtils.getCountryByIsoCode(state.baseLatestCurrency.isoCode ?? 'DE'),
                    isEnabled: true,
                    textController: context.read<LatestCurrencyBloc>().baseAmountController,
                    onChanged: (text) {
                      context.read<LatestCurrencyBloc>().add(ChangeBaseAmountEvent(amount: text));
                    },
                    keyboardType: TextInputType.number,
                    autofillHints: const [AutofillHints.transactionAmount],
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    onTapCurrency: (country) {
                      context.read<LatestCurrencyBloc>().add(ChangeBaseCurrencyEvent(currencySymbol: country.currencyCode ?? "EUR", isoCode: country.isoCode ?? "DE"));
                    },
                  ),
                  SizedBox(height: 30.h),
                  HeadingText(title: "CONVERT TO : ", isDarkMode: true),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      itemCount: state.savedCurrencyList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 10.h),
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 14.h),
                          child: Slidable(
                            /// Specify a key if the Slidable is dismissible.
                            key: UniqueKey(),
                            /// The start action pane is the one at the left or the top side.
                            endActionPane: ActionPane(
                              /// A motion is a widget used to control how the pane animates.
                              motion: const ScrollMotion(),
                              /// A pane can dismiss the Slidable.
                              dismissible: DismissiblePane(
                                onDismissed: () {
                                  context.read<LatestCurrencyBloc>().add(RemoveCurrencyEvent(index: index));
                                },
                                dismissalDuration: const Duration(milliseconds: 0),
                                resizeDuration: const Duration(milliseconds: 0),
                                dismissThreshold: 0.85,
                              ),
                              /// All actions are defined in the children parameter.
                              children: [
                                /// A SlidableAction can have an icon and/or a label.
                                SlidableAction(
                                  onPressed: (context) {
                                    context.read<LatestCurrencyBloc>().add(RemoveCurrencyEvent(index: index));
                                    slidableController.close();
                                  },
                                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                  /// TODO: Reuse the color
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  // Translate the message
                                  label: 'Remove',
                                ),
                              ],
                            ),
                            /// The child of the Slidable is what the user sees when the
                            /// component is not dragged.
                            child: CurrencyCard(
                              hint: state.savedCurrencyList[index].amount?.toStringAsFixed(2),
                              isDarkMode: true,
                              selectedCountry: CountryPickerUtils.getCountryByIsoCode(state.savedCurrencyList[index].isoCode ?? 'DE'),
                              onTapCurrency: (country) {
                                context.read<LatestCurrencyBloc>().add(EditConvertedCurrencyEvent(index: index, currencySymbol: country.currencyCode ?? "EUR", isoCode: country.isoCode ?? "DE"));
                                EasyLoading.show(status: "Please Wait", dismissOnTap: false);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  MainButton(
                    height: 32.h,
                    margin: EdgeInsets.symmetric(horizontal: 118.w),
                    // Translate the message
                    title: "+ ADD CONVERTER",
                    titleSize: 12,
                    borderRadius: 15,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _openCurrencyPickerDialog(context);
                    },
                  ),
                  SizedBox(height: 40.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _openCurrencyPickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<LatestCurrencyBloc>(context),
          child: Theme(
            data: Theme.of(context).copyWith(primaryColor: kColorBlack),
            child: CurrencyPickerDialog(
              titlePadding: EdgeInsets.all(8.0),
              searchCursorColor: kColorBlack,
              searchInputDecoration: InputDecoration(hintText: 'Search...'),
              isSearchable: true,
              title: Text('Select your Currency'),
              onValuePicked: (Country country) {
                context.read<LatestCurrencyBloc>().add(AddLatestCurrencyEvent(currencySymbol: country.currencyCode ?? "EUR", isoCode: country.isoCode ?? "DE"));
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
          ),
        );
      },
    );
  }
}
