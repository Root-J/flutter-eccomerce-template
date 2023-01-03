import '../../presentation/resources/strings_manager.dart';
import 'base_validator.dart';

class PhoneValidator extends BaseValidator {
  @override
  String getMessage() {
    return '* ${AppStrings.phoneValidationMessage}';
  }

  @override
  bool validate(String? value) {
    final regex = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    return regex.hasMatch(value!) && value.length > 5;
  }
}
