import 'package:meu_gabarito/validators/email.dart';
import 'package:meu_gabarito/validators/length.dart';
import 'package:meu_gabarito/validators/required.dart';

String? validatePasswordField(String? value) {
  String? validationResult = validateRequired(value);
  if (validationResult is String) return validationResult;
  return validateLength(value, min: 8);
}

String? validateEmailField(String? value) {
  String? validationResult = validateRequired(value);
  if (validationResult is String) return validationResult;
  return validateEmail(value);
}
