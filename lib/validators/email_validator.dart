import 'package:email_validator/email_validator.dart';

String? validateEmail(String? email) {
  if (email != null && !EmailValidator.validate(email)) {
    return "Insira um email válido";
  }
  return null;
}
