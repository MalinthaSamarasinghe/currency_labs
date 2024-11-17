// import 'package:formz/formz.dart';
// import 'package:flutter/material.dart';
// import '../../../../../utils/font.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../core/locales/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// class RegistrationCodeAlert extends StatelessWidget {
//   final bool isMobile;
//   final TextEditingController codeController;
//
//   const RegistrationCodeAlert({
//     super.key,
//     this.isMobile = true,
//     required this.codeController,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       child: AlertDialog(
//         backgroundColor: kWhite,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.r)),
//         title: Center(
//           child: Column(
//             children: [
//               Text(
//                 LocaleKeys.features_signUp_ui_alertTitle.tr(),
//                 style: kGilroy20600(context),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 18.h),
//               Text(
//                 LocaleKeys.features_signUp_ui_alertSubTitle.tr(),
//                 style: kGilroy15400(context, color: kBlack),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//         titlePadding: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
//         content: BlocSelector<BusinessRegistrationCodeBloc, BusinessRegistrationCodeState, RegistrationCodeForm>(
//           selector: (state) {
//             return state.businessCardParam;
//           },
//           builder: (context, businessCard) {
//             return RegistrationCodeAlertTextField(
//               hint: LocaleKeys.features_signUp_ui_codeHere.tr(),
//               textController: codeController,
//               keyboardType: TextInputType.number,
//               autofillHints: const [AutofillHints.oneTimeCode],
//               textInputAction: TextInputAction.done,
//               onChanged: (text) {
//                 context.read<BusinessRegistrationCodeBloc>().add(BusinessRegistrationCodeEntered(paramCode: text));
//               },
//               isValid: businessCard.valid,
//               errorText: businessCard.pure ? null : businessCard.error?.message,
//             );
//           },
//         ),
//         contentPadding: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Bounce(
//                   borderRadius: 15.r,
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     height: 53.h,
//                     // width: 120.w,
//                     decoration: BoxDecoration(
//                       color: kWhite,
//                       borderRadius: BorderRadius.circular(15.r),
//                       border: Border.all(width: 0.25, color: kBlack),
//                     ),
//                     child: Center(
//                       child: Text(
//                         LocaleKeys.common_ui_cancel.tr(),
//                         textAlign: TextAlign.center,
//                         style: kGilroy16400(context, color: kBlack),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10.w),
//               Expanded(
//                 child: BlocConsumer<BusinessRegistrationCodeBloc, BusinessRegistrationCodeState>(
//                   listener: (context, state) {
//                     if (state.status == FormzStatus.submissionInProgress) {
//                       FocusManager.instance.primaryFocus?.unfocus();
//                       EasyLoading.show(status: LocaleKeys.features_signUp_alerts_pleaseWait.tr(), dismissOnTap: false);
//                     }
//                     if (state.status == FormzStatus.submissionFailure) {
//                       EasyLoading.dismiss();
//                       FocusManager.instance.primaryFocus?.unfocus();
//                       Future.delayed(const Duration(milliseconds: 100), () {
//                         CustomFlushBar.primary(context: context, message: state.errorMessage ?? LocaleKeys.features_signUp_alerts_companyNotFound.tr());
//                       });
//                     }
//                     if (state.status == FormzStatus.submissionSuccess) {
//                       FocusManager.instance.primaryFocus?.unfocus();
//                       EasyLoading.dismiss();
//                       Future.delayed(const Duration(milliseconds: 100), () {
//                         context.read<SignUpUserBloc>().add(BusinessSelected(state.businessCard!));
//                       });
//                       Navigator.pop(context);
//                     }
//                   },
//                   builder: (context, state) {
//                     return Bounce(
//                       borderRadius: 15.r,
//                       onTap: () {
//                         context.read<BusinessRegistrationCodeBloc>().add(BusinessRegistrationCodeRequested());
//                       },
//                       child: Container(
//                         height: 53.h,
//                         // width: 120.w,
//                         decoration: BoxDecoration(
//                           color: kStaticsSmallContainer,
//                           borderRadius: BorderRadius.circular(15.r),
//                           border: Border.all(width: 0.25, color: kBlack),
//                         ),
//                         child: Center(
//                           child: Text(
//                             LocaleKeys.common_ui_confirm.tr(),
//                             textAlign: TextAlign.center,
//                             style: kGilroy16400(context),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//         actionsPadding: EdgeInsets.only(top: 26.h, left: 24.w, right: 24.w, bottom: 24.h),
//         actionsAlignment: MainAxisAlignment.center,
//       ),
//     );
//   }
// }
