import '../../../presentation/resources/strings_manager.dart';
import '../base_validator.dart';

class SecurityCodeValidation extends BaseValidator {
  @override
  String getMessage() {
    return '* ${AppStrings.securityCodeValidationMessage}';
  }

  @override
  bool validate(String? value) {
    return value!.length == 4 && RegExp(r'^-?[0-9]+$').hasMatch(value);
  }
}
