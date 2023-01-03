import '../../presentation/resources/strings_manager.dart';
import 'base_validator.dart';

class EmailValidator extends BaseValidator {
  @override
  String getMessage() {
    return '* ${AppStrings.emailValidationMessage}';
  }

  @override
  bool validate(String? value) {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    // .hasMatch(email);
    return regex.hasMatch(value!);
  }
}
