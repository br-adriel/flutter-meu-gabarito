import 'package:meu_gabarito/enums/alternativa.dart';

class Questao {
  String id;
  int numero;
  Alternativa alternativaSelecionada;
  Alternativa? alternativaCorreta;
  bool corrigida;

  Questao({
    required this.id,
    required this.alternativaSelecionada,
    required this.corrigida,
    required this.numero,
    this.alternativaCorreta,
  });
}
