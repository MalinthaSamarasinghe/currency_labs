import 'package:formz/formz.dart';
import '../../locales/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

/// Validation errors for the [CommonField] [FormzInput].
enum CommonValidationErrorType {
  /// Generic invalid error.
  empty,
  invalid,
}

class CommonValidationError {
  final CommonValidationErrorType type;
  final String message;

  CommonValidationError({required this.type, required this.message});
}

/// Form input for a common input.
class CommonFormzModel extends FormzInput<String, CommonValidationError> {
  const CommonFormzModel.pure() : super.pure("");

  const CommonFormzModel.dirty(super.value) : super.dirty();

  @override
  CommonValidationError? validator(String value) {
    if (value.isEmpty) {
      return CommonValidationError(
        type: CommonValidationErrorType.empty,
        message: LocaleKeys.common_validations_common_shouldNotEmpty.tr(),
      );
    }
    return null;
  }
}
