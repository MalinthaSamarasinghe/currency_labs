import 'package:formz/formz.dart';
import '../../other/regular_expressions.dart';

enum NameValidationErrorType {
  empty,
  invalid,
  invalidLength,
}

class NameValidationError {
  final NameValidationErrorType type;
  final String message;

  NameValidationError({required this.type, required this.message});
}

class NameFormzModel extends FormzInput<String, NameValidationError> {
  const NameFormzModel.pure() : super.pure("");

  const NameFormzModel.dirty(super.value) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if(value.isEmpty) {
      // Translate the message
      return NameValidationError(
        type: NameValidationErrorType.empty,
        message: "The name shouldn't be empty",
      );
    }
    if(!RegularExpressions.fullName.hasMatch(value)) {
      // Translate the message
      return NameValidationError(
        type: NameValidationErrorType.invalid,
        message: "The name should consist of only letters",
      );
    }
    if(value.length < 3) {
      // Translate the message
      return NameValidationError(
        type: NameValidationErrorType.invalidLength,
        message: "The name should contain at least 3 letters",
      );
    }
    return null;
  }
}
