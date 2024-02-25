String? validateSize(String? value) {
  if (value == null || value.isEmpty) return 'Preencha o campo';

  int? parsedValue = int.tryParse(value);
  if (parsedValue == null) return 'Preencha o campo com um número válido';
  if (parsedValue <= 0) return 'O campo deve ser um valor maior que zero';
  if (parsedValue > 500) return 'O campo deve ser um valor até 500';

  return null;
}

String? validateIndex(String? value) {
  if (value == null || value.isEmpty) return 'Preencha o campo';

  int? parsedValue = int.tryParse(value);
  if (parsedValue == null) return 'Preencha o campo com um número válido';

  return null;
}
