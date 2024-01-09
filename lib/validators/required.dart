String? validateRequired(String? value) {
  if (value == null || value.isEmpty) {
    return "Preencha o campo";
  }
  return null;
}
