import '../../presentation/resources/strings_manager.dart';
import 'base_validator.dart';

class NameValidator extends BaseValidator {
  @override
  String getMessage() {
    return '* ${AppStrings.nameValidationMessage}';
  }

  @override
  bool validate(String? value) {
    return RegExp(r'^[A-Za-z]+$').hasMatch(value!);
  }
}
