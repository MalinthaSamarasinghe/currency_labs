// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "common": {
    "validations": {
      "common": {
        "shouldNotEmpty": "This field shouldn't be empty"
      }
    },
    "errors": {
      "server": {
        "authenticatedUser": "The authenticated user is not allowed to access the specified API endpoint!",
        "authenticationFail": "Authentication failed. Please Login again!",
        "badRequest": "Bad request!",
        "connectionTimeOut": "Connection timed out. Try again or later!",
        "dataValidationFailed": "Data validation failed!",
        "failedToVerifyEmail": "Failed to verify email!",
        "invalidMethod": "Method not allowed. Please check the Allow header for the allowed HTTP methods!",
        "notFoundMail": "This email was not found!",
        "receiveTimeOut": "Receiving timeout occurred. Try again or later!",
        "redirectionFurtherActionNeeds": "Redirection: further action needs to be taken in order to complete the request!",
        "requestCancelled": "Request to the server was cancelled!",
        "sendTimeOut": "Request send timeout. Try again or later!",
        "serverError": "Internal server error. Please contact admin!",
        "socketException": "Request failed. Make sure your connection has internet access!",
        "somethingWentWrong": "Something went wrong!",
        "toManyRequests": "Too many requests!",
        "unexpectedError": "Unexpected error occurred!",
        "unhandledStatusCode": "Oops something went wrong! Error {}",
        "unsupportedMediaType": "Unsupported media type. The requested content type or version number is invalid!",
        "urlNotFound": "The requested resource does not exist!"
      }
    },
    "failure": {
      "sessionExpired": "Session expired. Please log in again!",
      "somethingWrongTryAgain": "Something went wrong. Please try again later!",
      "accountDeleted": "Account Deleted Successfully!"
    }
  }
};
static const Map<String,dynamic> si_LK = {
  "common": {
    "validations": {
      "common": {
        "shouldNotEmpty": "මෙම ක්ෂේත්‍රය හිස් නොවිය යුතුය"
      }
    },
    "errors": {
      "server": {
        "authenticatedUser": "සත්‍යාපිත පරිශීලකයාට විශේෂ API ඉලක්කය භාවිතා කිරීමට අවසර නැත!",
        "authenticationFail": "සත්‍යාපනය අසාර්ථකයි. කරුණාකර නැවත ලොග් වන්න!",
        "badRequest": "වැරදි ඉල්ලීමක්!",
        "connectionTimeOut": "සම්බන්ධතාවය කාලය ඉකුත්වී ඇත. නැවත උත්සාහ කරන්න හෝ පසුව උත්සාහ කරන්න!",
        "dataValidationFailed": "දත්ත සත්‍යාපනය අසාර්ථකයි!",
        "failedToVerifyEmail": "විද්‍යුත් තැපෑල සත්‍යාපනය අසාර්ථකයි!",
        "invalidMethod": "ක්‍රමය අවසර නැත. අවසර ලත් HTTP ක්‍රම සඳහා කරුණාකර අවසර ශීර්ෂය පරීක්ෂා කරන්න!",
        "notFoundMail": "මෙම විද්‍යුත් තැපෑල සොයාගැනීමට නොහැකි විය!",
        "receiveTimeOut": "ලබාදුන්නා කාලය අවසන් විය. නැවත උත්සාහ කරන්න හෝ පසුව උත්සාහ කරන්න!",
        "redirectionFurtherActionNeeds": "යළි හරවා යැවීම: ඉල්ලීම සම්පූර්ණ කිරීම සඳහා වැඩිදුර ක්‍රියාමාර්ග ගත යුතුය!",
        "requestCancelled": "සේවාදායකයට ඉල්ලීම අවලංගු කර ඇත!",
        "sendTimeOut": "ඉල්ලීම කාල අවසන් විය. නැවත උත්සාහ කරන්න හෝ පසුව උත්සාහ කරන්න!",
        "serverError": "අභ්යන්තර සේවාදායක දෝෂයක්. කරුණාකර පරිපාලනයට සම්බන්ධ වන්න!",
        "socketException": "ඉල්ලීම අසාර්ථක විය. ඔබගේ සම්බන්ධතාවයට අන්තර්ජාල ප්‍රවේශය ඇති බවට වග බලා ගන්න!",
        "somethingWentWrong": "යම් වැරැද්දක් සිදු විය!",
        "toManyRequests": "ඉල්ලීම් වැඩියි!",
        "unexpectedError": "අනපේක්ෂිත දෝෂයක් සිදු විය!",
        "unhandledStatusCode": "අපොයි යම් වැරදී සිදු විය! දෝෂය {}",
        "unsupportedMediaType": "සහාය නොදක්වන මාධ්‍ය වර්ගය. අනුමැතිය අනුවාදයේ අනුපිටපතේ සංක්‍රමණය හෝ ප්‍රකාර අංකය වලංගු නොවේ!",
        "urlNotFound": "ඉල්ලීමේ අයිතමය නොපවතී!"
      }
    },
    "failure": {
      "sessionExpired": "සැසිය කල් ඉකුත් විය. කරුණාකර නැවත ලොග් වන්න!",
      "somethingWrongTryAgain": "යම් වැරැද්දක් සිදු විය. කරුණාකර පසුව නැවත උත්සාහ කරන්න!",
      "accountDeleted": "ගිණුම සාර්ථකව මකා ඇත!"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "si_LK": si_LK};
}
