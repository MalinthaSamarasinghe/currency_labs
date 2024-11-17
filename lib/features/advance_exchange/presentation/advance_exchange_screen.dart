import '../../../injector.dart';
import 'widgets/heading_text.dart';
import 'widgets/currency_card.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'blocs/latest_currency_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/bloc_state_status.dart';
import '../../../core/presentation/screen_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class _AdvanceExchangeScreenState extends State<AdvanceExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: Scaffold(
        backgroundColor: kBg,
        appBar: ScreenAppBar(
          contentColor: kColorWhite,
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
          child: BlocBuilder<LatestCurrencyBloc, LatestCurrencyState>(
            buildWhen: (prev, current) {
              if (prev.currencyStatus == BlocStateStatus.initial && current.currencyStatus == BlocStateStatus.loadInProgress) {
                return false;
              } else {
                return true;
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 26.h),
                  HeadingText(title: "INSERT AMOUNT : ", isDarkMode: true),
                  CurrencyCard(amount: (state.baseLatestCurrency.amount ?? 1.00).toStringAsFixed(2), isDarkMode: true, isoCode: state.baseLatestCurrency.isoCode ?? ''),
                  SizedBox(height: 30.h),
                  HeadingText(title: "CONVERT TO : ", isDarkMode: true),
                  CurrencyCard(amount: "12.00", isDarkMode: true, isoCode: ''),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

// void _showBusinessSelectionView() {
//   showDialog<String>(
//     context: context,
//     barrierDismissible: false,
//     barrierColor: barrierColor,
//     builder: (_) {
//       codeController.text = context.read<BusinessRegistrationCodeBloc>().state.businessCardParam.value;
//       return BlocProvider.value(
//         value: BlocProvider.of<BusinessRegistrationCodeBloc>(context),
//         child: BlocProvider.value(
//           value: BlocProvider.of<SignUpUserBloc>(context),
//           child: RegistrationCodeAlert(codeController: codeController),
//         ),
//       );
//     },
//   );
// }
}
