String? validateSize(String? value) {
  if (value == null || value.isEmpty) return 'Preencha o campo';

  int? parsedValue = int.tryParse(value);
  if (parsedValue == null) return 'Preencha o campo com um número válido';
  if (parsedValue <= 0) return 'O campo deve ser um valor maior que zero';

  return null;
}
