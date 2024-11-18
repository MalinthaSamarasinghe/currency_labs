import 'dart:developer';
import 'package:dio/dio.dart';
import '../locales/locale_keys.g.dart';
import '../models/dio_response_model.dart';
import '../network/server_error_data.dart';
import 'package:easy_localization/easy_localization.dart';

/// Exception for the HTTP requests from Dio
class ServerException implements Exception {
  late String errorMessage;
  late bool unexpectedError;
  ServerErrorData? data;

  ServerException({required this.errorMessage, required this.unexpectedError});

  /// Constructor for Dio package
  ServerException.fromDioError(DioException dioError) {
    data = ServerErrorData.fromDioError(dioError);
    log("ServerErrorData --> responseData.data: ${data?.responseData.data}");
    log("ServerErrorData --> responseData.statusCode: ${data?.responseData.statusCode}");
    log("ServerErrorData --> responseData.statusMessage: ${data?.responseData.statusMessage}");
    log("ServerErrorData --> responseData.isRedirect: ${data?.responseData.isRedirect}\n");
    log("ServerErrorData --> requestData.url: ${data?.requestData.url}");
    log("ServerErrorData --> requestData.method: ${data?.requestData.method}");
    log("ServerErrorData --> requestData.headers: ${data?.requestData.headers}");
    log("ServerErrorData --> requestData.sendTimeout: ${data?.requestData.sendTimeout}");
    log("ServerErrorData --> requestData.receiveTimeout: ${data?.requestData.receiveTimeout}");
    log("ServerErrorData --> requestData.contentType: ${data?.requestData.contentType}\n");
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = LocaleKeys.common_errors_server_requestCancelled.tr();
        unexpectedError = false;
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = LocaleKeys.common_errors_server_connectionTimeOut.tr();
        unexpectedError = false;
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = LocaleKeys.common_errors_server_receiveTimeOut.tr();
        unexpectedError = false;
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = LocaleKeys.common_errors_server_sendTimeOut.tr();
        unexpectedError = false;
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response);
        break;
      case DioExceptionType.connectionError:
        errorMessage = LocaleKeys.common_errors_server_socketException.tr();
        break;
      case DioExceptionType.unknown:
        errorMessage = LocaleKeys.common_errors_server_unexpectedError.tr();
        unexpectedError = true;
        break;
      case DioExceptionType.badCertificate:
        // Translate the message
        errorMessage = "Bad Certificate";
        unexpectedError = true;
        break;
      default:
        errorMessage = LocaleKeys.common_errors_server_somethingWentWrong.tr();
        unexpectedError = true;
        break;
    }
  }

  String _handleStatusCode(Response? response) {
    int? statusCode = response?.statusCode;
    switch (statusCode) {
      case 302:
        unexpectedError = true;
        return LocaleKeys.common_errors_server_redirectionFurtherActionNeeds.tr();
      case 400:
        unexpectedError = true;
        // return LocaleKeys.common_errors_server_badRequest.tr();
        // Translate the message
        return "Your subscription plan only allows EUR-based currency conversion! Please upgrade your Subscription Plan.";
      case 401:
        unexpectedError = false;
        // return LocaleKeys.common_errors_server_authenticationFail.tr();
        // Translate the message
        return "You have not supplied an API Access Key. Please contact support.";
      case 403:
        unexpectedError = false;
        return LocaleKeys.common_errors_server_authenticatedUser.tr();
      case 404:
        unexpectedError = true;
        return LocaleKeys.common_errors_server_urlNotFound.tr();
      case 405:
        unexpectedError = true;
        return LocaleKeys.common_errors_server_invalidMethod.tr();
      case 410:
        unexpectedError = true;
        return LocaleKeys.common_errors_server_notFoundMail.tr();
      case 411:
        unexpectedError = true;
        return LocaleKeys.common_failure_somethingWrongTryAgain.tr();
      case 415:
        unexpectedError = true;
        return LocaleKeys.common_errors_server_unsupportedMediaType.tr();
      case 420:
        unexpectedError = true;
        return LocaleKeys.common_errors_server_failedToVerifyEmail.tr();
      case 422:
        unexpectedError = false;
        return _getDataValidationErrorMessage(response) ?? LocaleKeys.common_errors_server_dataValidationFailed.tr();
      case 423:
        unexpectedError = true;
        return LocaleKeys.common_failure_somethingWrongTryAgain.tr();
      case 429:
        unexpectedError = true;
        // return LocaleKeys.common_errors_server_toManyRequests.tr();
        // Translate the message
        return "Your monthly usage limit has been reached. Please upgrade your Subscription Plan.";
      case 500:
        unexpectedError = true;
        return LocaleKeys.common_errors_server_serverError.tr();
      case 433:
        unexpectedError = true;
        return LocaleKeys.common_failure_somethingWrongTryAgain.tr();
      case 434:
        unexpectedError = true;
        return LocaleKeys.common_failure_somethingWrongTryAgain.tr();
      default:
        unexpectedError = true;
        return LocaleKeys.common_errors_server_unhandledStatusCode.tr(args: [statusCode.toString()]);
    }
  }

  /// Generate Validation Errors (Status 422)
  String? _getDataValidationErrorMessage(Response? response) {
    try {
      DioResponseModel res = dioResponseModelFromJson(response?.data);
      if (res.errors?.email != null) {
        return res.errors?.email?.first;
      }
      if (res.errors?.contactNumber != null) {
        return res.errors?.contactNumber?.first;
      }
      if (res.errors?.name != null) {
        return res.errors?.name?.first;
      }
      if (res.errors?.invalidCredentials != null) {
        return res.errors?.invalidCredentials?.first;
      }
      if (res.errors?.password != null) {
        return res.errors?.password?.first;
      }
      if (res.errors?.invalidDefaultPassword != null) {
        return res.errors?.invalidDefaultPassword?.first;
      }
      if (res.message != null || res.message != "") {
        return res.message;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  String toString() {
    return 'ServerException{errorMessage: $errorMessage, unexpectedError: $unexpectedError, data: $data}';
  }
}

/// Throws when there's no shared pref data to fetch
// class CacheException implements Exception {}

/// Thrown during the sign up process if a failure occurs.
class SignUpWithEmailAndPasswordFailure implements Exception {
  /// The associated error message.
  final String message;

  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}

/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
class LogInWithEmailAndPasswordFailure implements Exception {
  /// The associated error message.
  final String message;

  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Wrong password provided for that user.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'invalid-credential':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}

/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
class LogInWithGoogleFailure implements Exception {
  /// The associated error message.
  final String message;

  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }
}

/// Thrown during the Cloud Storage process if a failure occurs.
class CloudStorageFailure implements Exception {
  /// The associated error message.
  final String message;

  const CloudStorageFailure([
    // Translate the message
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase exception code.
  factory CloudStorageFailure.fromCode(String code) {
    switch (code) {
      case "storage/unknown":
        return const CloudStorageFailure(
          // Translate the message
          'An unknown error occurred.',
        );
      case "storage/object-not-found":
        return const CloudStorageFailure(
          // Translate the message
          'No object exists at the desired reference.',
        );
      case 'storage/bucket-not-found':
        return const CloudStorageFailure(
          // Translate the message
          'No bucket is configured for Cloud Storage.',
        );
      case 'storage/project-not-found':
        return const CloudStorageFailure(
          'No project is configured for Cloud Storage.',
        );
      case 'storage/quota-exceeded':
        return const CloudStorageFailure(
          "Quota on your Cloud Storage bucket has been exceeded. If you're on the no-cost tier, upgrade to a paid plan. If you're on a paid plan, reach out to Firebase support.",
        );
      case 'storage/unauthenticated':
        return const CloudStorageFailure(
          'User is not authorized to perform the desired action, check your security rules to ensure they are correct.',
        );
      case 'storage/retry-limit-exceeded':
        return const CloudStorageFailure(
          'The maximum time limit on an operation (upload, download, delete, etc.) has been exceeded. Try uploading again.',
        );
      case 'storage/invalid-checksum':
        return const CloudStorageFailure(
          'File on the client does not match the checksum of the file received by the server. Try uploading again.',
        );
      case 'storage/canceled':
        return const CloudStorageFailure(
          'User canceled the operation.',
        );
      case 'storage/invalid-event-name':
        return const CloudStorageFailure(
          'Invalid event name provided. Must be one of [running, progress, pause].',
        );
      case 'storage/invalid-url':
        return const CloudStorageFailure(
          'Invalid URL provided to refFromURL(). Must be of the form: gs://bucket/object or https://firebasestorage.googleapis.com/v0/b/bucket/o/object?token=<TOKEN>.',
        );
      case 'storage/invalid-argument':
        return const CloudStorageFailure(
          'The argument passed to put() must be File, Blob, or UInt8 Array. The argument passed to putString() must be a raw, Base64, or Base64URL string.',
        );
      case 'storage/no-default-bucket':
        return const CloudStorageFailure(
          "No bucket has been set in your config's storageBucket property.",
        );
      case 'storage/cannot-slice-blob':
        return const CloudStorageFailure(
          "Commonly occurs when the local file has changed (deleted, saved again, etc.). Try uploading again after verifying that the file hasn't changed.",
        );
      case 'storage/server-file-wrong-size':
        return const CloudStorageFailure(
          'File on the client does not match the size of the file received by the server. Try uploading again.',
        );
      default:
        return const CloudStorageFailure();
    }
  }
}

/// Thrown during the logout process if a failure occurs.
// class LogOutFailure implements Exception {}

/// Use to throw exception when the user not grant device permissions
// class NoPermission implements Exception {}

/// Use to throw platform related exceptions
// class DeviceException implements Exception {
//   final String message;
//
//   const DeviceException({
//     required this.message,
//   });
// }
