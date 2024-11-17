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
  "features": {
    "login": {
      "username": "Username",
      "password": "Password",
      "forgotPassword": "Forgot Password ?",
      "rememberMe": "Remember Me",
      "signIn": "Sign In"
    },
    "openCashRegister": {
      "Location": "Location",
      "cashInHand": "Cash in Hand",
      "openCashRegister": "Open Cash Register",
      "openRegister": "Open Register"
    },
    "home": {
      "welcome": "Welcome",
      "pos": "POS"
    },
    "customer": {
      "customers": "Customers",
      "customerSelectedSuccessfully": "The customer selected successfully!",
      "customerCurrentlyInUse": "This customer is currently in use!"
    },
    "scan": {
      "scanBarCode": "Scan Barcode"
    },
    "paymentSuccess": {
      "saleAddedSuccessful": "Sale Added Successful",
      "successfullyAddedSale": "You have successfully added the sale",
      "backToHome": "Back to Home"
    },
    "product": {
      "products": "Products",
      "productAddedSuccessfully": "The product was added successfully!",
      "ProductOutOfStock": "The product is out of stock!",
      "productAlreadyAdded": "This product has already been added!"
    }
  },
  "common": {
    "validations": {
      "email": {
        "emailShouldNotEmpty": "Email shouldn't be empty!",
        "validEmail": "Please enter a valid email!"
      },
      "password": {
        "passwordLeastEight": "Password should be at least 8 characters long!",
        "passwordLeastLower": "Password should contain at least one lowercase letter!",
        "passwordLeastSpecial": "Password should contain at least one special character!",
        "passwordLeastUpper": "Password should contain at least one uppercase letter!",
        "passwordShouldNotEmpty": "Password shouldn't be empty!",
        "passwordsNotMatch": "Passwords do not match!",
        "confirmPasswordShouldNotEmpty": "Confirm password shouldn't be empty!"
      },
      "common": {
        "shouldNotEmpty": "This field shouldn't be empty"
      },
      "location": {
        "locationShouldNotEmpty": "Location shouldn't be empty!",
        "validLocation": "Please enter a valid location!"
      },
      "cash": {
        "cashShouldNotEmpty": "Cash in hand shouldn't be empty!",
        "validCash": "Cash in hand shouldn't contain special characters!",
        "validCashZero": "Cash in hand shouldn't be zero!"
      },
      "userName": {
        "userNameShouldNotEmpty": "Username shouldn't be empty!",
        "validUserName": "Username shouldn't contain special characters & numbers!",
        "validUserNameLength": "Username should be at least two characters!"
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
      "error": "Error",
      "checkInternetConnection": "Please check your internet connection and try again!",
      "dataFetchFailed": "Data fetching failed. Please try again later!",
      "noDataAvailable ": "No Data Available!",
      "noPermissionGranted": "No permission granted!",
      "sessionExpired": "Session expired. Please log in again!",
      "somethingWrongTryAgain": "Something went wrong. Please try again later!",
      "accountDeleted": "Account Deleted Successfully!",
      "noRelevantData": "Sorry we couldn't find any relevant data right now!"
    },
    "widgets": {
      "pleaseWait": "Please Wait",
      "underDevelopment": "Under Development!",
      "waitingForData": "Waiting for data...",
      "clear": "Clear",
      "logout": "Logout",
      "search": "Search"
    }
  }
};
static const Map<String,dynamic> si_LK = {
  "features": {
    "login": {
      "username": "පරිශීලක නාමය",
      "password": "මුරපදය",
      "forgotPassword": "මුරපදය අමතක වුණා ද ?",
      "rememberMe": "මාව මතක තබන්න",
      "signIn": "ඇතුල් වන්න"
    },
    "openCashRegister": {
      "Location": "ස්ථානය",
      "cashInHand": "අතේ මුදල්",
      "openCashRegister": "මුදල් ලේඛනය විවෘත කරන්න",
      "openRegister": "ලේඛනය විවෘත කරන්න"
    },
    "home": {
      "welcome": "සාදරයෙන් පිළිගනිමු",
      "pos": "විකුණුම් ස්ථානය"
    },
    "customer": {
      "customers": "පාරිභෝගිකයන්",
      "customerSelectedSuccessfully": "පාරිභෝගිකයා සාර්ථකව තෝරා ඇත!",
      "customerCurrentlyInUse": "මෙම පාරිභෝගිකයා දැනට භාවිතා කරයි!"
    },
    "scan": {
      "scanBarCode": "තීරු කේතය පරිලෝකනය කරන්න"
    },
    "paymentSuccess": {
      "saleAddedSuccessful": "අලෙවිය එකතු කිරීම සාර්ථකයි",
      "successfullyAddedSale": "ඔබ සාර්ථකව විකිණීම එක් කර ඇත",
      "backToHome": "ආපසු නිවසට"
    },
    "product": {
      "products": "නිෂ්පාදන",
      "productAddedSuccessfully": "නිෂ්පාදනය සාර්ථකව එකතු කරන ලදී!",
      "ProductOutOfStock": "නිෂ්පාදනය තොග ඉවරයි!",
      "productAlreadyAdded": "මෙම නිෂ්පාදනය දැනටමත් එකතු කර ඇත!"
    }
  },
  "common": {
    "validations": {
      "email": {
        "emailShouldNotEmpty": "විද්‍යුත් තැපෑල හිස් නොවිය යුතුය!",
        "validEmail": "කරුණාකර වලංගු විද්‍යුත් තැපෑලක් ඇතුළු කරන්න!"
      },
      "password": {
        "passwordLeastEight": "මුරපදය අවම වශයෙන් අක්ෂර 8 ක් දිග විය යුතුය!",
        "passwordLeastLower": "මුරපදයේ අවම වශයෙන් එක් කුඩා අක්ෂරයක්වත් අඩංගු විය යුතුය!",
        "passwordLeastSpecial": "මුරපදයේ අවම වශයෙන් එක් විශේෂ අක්ෂරයක්වත් අඩංගු විය යුතුය!",
        "passwordLeastUpper": "මුරපදයේ අවම වශයෙන් එක් ලොකු අක්ෂරයක්වත් අඩංගු විය යුතුය!",
        "passwordShouldNotEmpty": "මුරපදය හිස් නොවිය යුතුය!",
        "passwordsNotMatch": "මුරපද ගැලපෙන්නේ නැත!",
        "confirmPasswordShouldNotEmpty": "මුරපදය හිස් නොවිය යුතුය!"
      },
      "common": {
        "shouldNotEmpty": "මෙම ක්ෂේත්‍රය හිස් නොවිය යුතුය"
      },
      "location": {
        "locationShouldNotEmpty": "ස්ථානය හිස් නොවිය යුතුය!",
        "validLocation": "කරුණාකර වලංගු ස්ථානයක් ඇතුළු කරන්න!"
      },
      "cash": {
        "cashShouldNotEmpty": "අතේ ඇති මුදල් හිස් නොවිය යුතුය!",
        "validCash": "අතේ ඇති මුදල් විශේෂ අක්ෂර අඩංගු නොවිය යුතුය!",
        "validCashZero": "අතේ ඇති මුදල් ශුන්‍ය නොවිය යුතුය!"
      },
      "userName": {
        "userNameShouldNotEmpty": "පරිශීලක නාමය හිස් නොවිය යුතුය!",
        "validUserName": "පරිශීලක නමෙහි විශේෂ අක්ෂර සහ අංක අඩංගු නොවිය යුතුය!",
        "validUserNameLength": "පරිශීලක නාමය අවම වශයෙන් අක්ෂර දෙකක් විය යුතුය!"
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
      "error": "දෝෂයකි",
      "checkInternetConnection": "කරුණාකර ඔබගේ අන්තර්ජාල සම්බන්ධතාවය පරීක්ෂා කර නැවත උත්සාහ කරන්න!",
      "dataFetchFailed": "දත්ත ලබා ගැනීම අසාර්ථක විය. කරුණාකර පසුව නැවත උත්සාහ කරන්න!",
      "noDataAvailable ": "ලබා ගත හැකි දත්ත නැත!",
      "noPermissionGranted": "අවසර නැත!",
      "sessionExpired": "සැසිය කල් ඉකුත් විය. කරුණාකර නැවත ලොග් වන්න!",
      "somethingWrongTryAgain": "යම් වැරැද්දක් සිදු විය. කරුණාකර පසුව නැවත උත්සාහ කරන්න!",
      "accountDeleted": "ගිණුම සාර්ථකව මකා ඇත!",
      "noRelevantData": "කණගාටුයි අපට මේ මොහොතේ අදාළ දත්ත කිසිවක් සොයාගත නොහැකි විය!"
    },
    "widgets": {
      "pleaseWait": "කරුණාකර රැඳී සිටින්න",
      "underDevelopment": "සංවර්ධනය යටතේ!",
      "waitingForData": "දත්ත සඳහා රැඳී සිටිමින්...",
      "clear": "මකා දමන්න",
      "logout": "පිටවීම",
      "search": "සොයන්න"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "si_LK": si_LK};
}
