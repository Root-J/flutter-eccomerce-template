import 'base_validator.dart';

class OptionalValidator extends BaseValidator {
  @override
  String getMessage() {
    return '';
  }

  @override
  bool validate(String? value) {
    return true;
  }
}
