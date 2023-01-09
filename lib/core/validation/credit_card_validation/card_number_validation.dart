import '../../../presentation/resources/strings_manager.dart';
import '../base_validator.dart';

class CardNumberValidation extends BaseValidator {
  @override
  String getMessage() {
    return '* ${AppStrings.cardNumberValidationMessage}';
  }

  @override
  bool validate(String? value) {
    return value!.length == 16 && RegExp(r'^-?[0-9]+$').hasMatch(value);
  }
}
