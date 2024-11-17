import 'injector.dart';
import 'utils/font.dart';
import 'utils/colors.dart';
import 'utils/globals.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/locales/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/presentation/custom_snack_bar.dart';
import 'core/blocs/authentication/auth_bloc.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class CurrencyLabsAppWrapper extends StatelessWidget {
  const CurrencyLabsAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
        ),
      ],
      child: const CurrencyLabsApp(),
    );
  }
}

class CurrencyLabsApp extends StatefulWidget {
  const CurrencyLabsApp({super.key});

  @override
  State<CurrencyLabsApp> createState() => _CurrencyLabsAppState();
}

class _CurrencyLabsAppState extends State<CurrencyLabsApp> {
  bool navigatedToNextScreen = false;

  @override
  Widget build(BuildContext context) {
    /// Remove the splash screen
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, info) {
        return MaterialApp(
          builder: (context, child) {
            child = EasyLoading.init()(context, child);
            return ScrollConfiguration(
              behavior: AppBehavior(),
              child: child,
            );
          },
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: "Currency Labs",
          theme: ThemeData(
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: WidgetStateProperty.all(kColorRed),
              thickness: WidgetStateProperty.all(4.w),
              radius: Radius.circular(4.r),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kColorRed,
              selectionColor: kColorRed.withOpacity(0.3),
              selectionHandleColor: kColorRed,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          home: ResponsiveBuilder(
              builder: (context, info) {
                Globals.isMobile = info.isMobile;
                debugPrint("Device Screen Type: ${info.deviceScreenType}");
                // debugPrint("ScreenSize.width: ${info.screenSize.width} | ScreenSize.height: ${info.screenSize.height}");
                // debugPrint("Local Widget Size: ${info.localWidgetSize}");
                // debugPrint("Refined Size: ${info.refinedSize}");
                return ScreenUtilInit(
                  designSize: info.isMobile
                      ? const Size(390, 844)
                      : const Size(398, 278),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, child) {
                    return BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        _authListener(context, state);
                      },
                      listenWhen: (previous, current) {
                        return previous.authenticationStatus != current.authenticationStatus;
                      },
                      buildWhen: (previous, current) {
                        return !navigatedToNextScreen;
                      },
                      builder: (context, state) {
                        return _getNavigateNextScreen(context, info.deviceScreenType);
                      },
                    );
                  },
                );
              },
          ),
        );
      },
    );
  }

  /// Navigate to next screen base on user authentication
  Widget _getNavigateNextScreen(BuildContext context, DeviceScreenType screenType) {
    navigatedToNextScreen = true;

    if(screenType == DeviceScreenType.mobile) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    if(screenType == DeviceScreenType.mobile){
      switch (context.read<AuthBloc>().state.authenticationStatus) {
        case AuthStatus.authenticated:
          return const OnboardingScreen();
        default:
          return const OnboardingScreen();
      }
    } else {
      /// Currently supports only mobile portrait view.
      /// TODO: Future work - Implement a tablet-optimized UI for landscape and larger screens.
      return Container(
        color: kColorWhite,
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 100.w),
            padding: EdgeInsets.fromLTRB(8.w, 8.h, 5.w, 8.h),
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: kColorRed,
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
                  "assets/svg/warning.svg",
                  width: 8.w,
                  height: 8.w,
                  colorFilter: const ColorFilter.mode(kColorWhite, BlendMode.srcIn),
                ),
                SizedBox(width: 5.w),
                SizedBox(
                  width: 165.w,
                  child: AutoSizeText(
                    "This app is not supported on this device. Please use a mobile device to access the app.",
                    style: kOpenSans500(context, color: kColorWhite, fontSize: 5.sp),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 5,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  /// User will redirect to the login screen when the user session expired or user logout
  Future<void> _authListener(BuildContext context, AuthState state) async {
    switch (state.authenticationStatus) {
      case AuthStatus.authenticated:
        {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()), (route) => route.isFirst,
          );
        }
        break;
      case AuthStatus.unauthenticated:
        {
          EasyLoading.dismiss();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()), (route) => route.isFirst,
          );
        }
        break;
      case AuthStatus.sessionExpired:
        {
          EasyLoading.dismiss();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()), (route) => route.isFirst,
          );
          Future.delayed(const Duration(milliseconds: 100), () {
            CustomSnackBar().showSnackBar(
              context,
              msg: LocaleKeys.common_failure_sessionExpired.tr(),
              snackBarTypes: SnackBarTypes.error,
            );
          });
        }
        break;
      case AuthStatus.accountDeleted:
        {
          EasyLoading.dismiss();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()), (route) => route.isFirst,
          );
          Future.delayed(const Duration(milliseconds: 100), () {
            CustomSnackBar().showSnackBar(
              context,
              msg: LocaleKeys.common_failure_accountDeleted.tr(),
              snackBarTypes: SnackBarTypes.success,
            );
          });
        }
        break;
      default:
        {
          EasyLoading.dismiss();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()), (route) => route.isFirst,
          );
          Future.delayed(const Duration(milliseconds: 100), () {
            CustomSnackBar().showSnackBar(
              context,
              // Translate the message
              msg: "Oops something went wrong! Please log in again.",
              snackBarTypes: SnackBarTypes.error,
            );
          });
        }
    }
  }
}

/// To remove scroll glow
class AppBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
