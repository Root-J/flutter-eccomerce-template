import '../../../presentation/resources/strings_manager.dart';
import '../base_validator.dart';

class CardHolderValidation extends BaseValidator {
  @override
  String getMessage() {
    return '* ${AppStrings.cardHolderValidationMessage}';
  }

  @override
  bool validate(String? value) {
    List<String> name = value!.split(' ');
    return name.length == 2 &&
        RegExp(r'^[A-Za-z]+$').hasMatch(name[0]) &&
        RegExp(r'^[A-Za-z]+$').hasMatch(name[1]);
  }
}
