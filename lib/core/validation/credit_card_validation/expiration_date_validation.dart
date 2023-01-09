import '../../../presentation/resources/strings_manager.dart';
import '../base_validator.dart';

class ExpirationDateValidation extends BaseValidator {
  @override
  String getMessage() {
    return '* ${AppStrings.expirationDateValidationMessage}';
  }

  @override
  bool validate(String? value) {
    if (value!.contains('/')) {
      List<String> date = value.split('/');
      return date[0].length == 2 &&
          date[1].length == 4 &&
          RegExp(r'^-?[0-9]+$').hasMatch(date[0]) &&
          RegExp(r'^-?[0-9]+$').hasMatch(date[1]);
    } else {
      return false;
    }
  }
}
