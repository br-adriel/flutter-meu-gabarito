String? validateLength(String? value, {int? min, int? max}) {
  if (value != null) {
    if (min != null && value.length < min) {
      return "O campo deve ter no mínimo $min caracteres";
    }
    if (max != null && value.length > max) {
      return "O campo deve ter no máximo $min caracteres";
    }
  }
  return null;
}
