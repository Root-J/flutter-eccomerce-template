import '../../presentation/resources/strings_manager.dart';
import 'base_validator.dart';

class CouponValidator extends BaseValidator {
  @override
  String getMessage() {
    return '* ${AppStrings.couponValidationMessage}';
  }

  @override
  bool validate(String? value) {
    return value != null && value.isNotEmpty;
  }
}
