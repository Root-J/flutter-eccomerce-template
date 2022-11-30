import '../../presentation/resources/strings_manager.dart';
import 'base_validator.dart';

class PasswordValidator extends BaseValidator {
  @override
  String getMessage() {
    return '* ${AppStrings.passwordValidationMessage}';
  }

  @override
  bool validate(String? value) {
    return value != null && value.length >= 8;
  }
}
